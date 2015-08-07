require "geminfo/version"



require "net/http"
require "json"

begin
	require "json"
rescue LoadError
	abort("JSON is missing. (Use 'gem install json' from command line(terminal) and retry)") 
end

#Module name
module Geminfo

	#Class name
	class Stats
		#initialize all instance variables
		def initialize(name)
			#Converts gemname to lowercase
			@gemname = name.downcase

			#parse links
			@link = 'http://rubygems.org/api/v1/gems/' + @gemname + ".json"

			#Exception handling
			begin
				@page_content = Net::HTTP.get(URI.parse(@link))
			rescue
				abort "Internet Connection cannot be established"
			end
			#Exception handling
			begin
				@data_file = JSON.parse(@page_content)
			rescue
				abort "Check you have entered the right Gem name"
			end	
		end

		#Methods to return values
		def name
			#returns gem name
			return @gemname
		end

		def total
			#return Gem's total downloads for all versions
			total = @data_file["downloads"]
			total = total.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
		end

		def latest
			#returns Gem's total download for latest version 
			total = @data_file["version_downloads"]
			total = total.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
		end
		
		def latestversion
			#returns latest version of gem 
			@data_file["version"]
		end	

		def authors
			#returns gem's authors' names
			@data_file["authors"]
		end
			
		def info
			#returns gem's description
			@data_file["info"]
		end

		def licenses
			#returns gem's licenses
			@data_file["licenses"]
		end

		def metadata
			#returns gem's metadata
			return @data_file["metadata"].length == 0? "empty metadata" : metadata
		end

		def sha
			#returns gem's Secure Hash Algoruthm 256 Checksum
			@data_file["sha"]
		end

		def gemURL
			#returns gem's URL
			@data_file["gem_uri"]
		end

		def projectURL
			#returns gem's project URL
			@data_file["project_uri"]
		end

		def homepage
			#returns gem's dedicated website 
			@data_file["homepage_uri"]
		end

		def wikiURL
			#returns gem's wiki URL
			@data_file["wiki_uri"]
		end

		def docURL
			#returns gem's documentation URL
			@data_file["documentation_uri"]
		end

		def mailURL
			#returns gem's mailing list URL
			@data_file["mailing_list_uri"]
		end

		def sourceURL
			#returns gem's source-code URL
			@data_file["source_code_uri"]
		end

		def bugURL
			#returns gem's bug tracking URL
			@data_file["bug_tracker_uri"]
		end
	end

	#Module name
	def self.gemversions(gemname)
		#Converts gemname to lowercase
		@gemname = gemname.downcase

		#@gemversion = version
		#"https://rubygems.org/api/v1/downloads/eventsims-0.0.2.json"
		
		#parse links
		@link = 'http://rubygems.org/api/v1/versions/' + @gemname + ".json"

		#Exception handling
		begin
			@page_content = Net::HTTP.get(URI.parse(@link))
		rescue
			abort "Internet Connection cannot be established"
		end

		#Exception handling
		begin
			@data_file = JSON.parse(@page_content)
		rescue
			abort "Check you have entered the right Gem name"
		end

		# Printing values
		x = 0; while x < @data_file.size
			puts "Gemname: #{@gemname + "-" + @data_file[x]["number"]}"
			puts "Authors: #{@data_file[x]["authors"]}"
			puts "Built on: #{(@data_file[x]["built_at"])[0..9]}"
			puts "Total downloads: #{@data_file[x]["downloads_count"]}"
			puts "SHA 256 Checksum: #{@data_file[x]["sha"] }"
			puts ""
			x+=1
		end
	end 

	
	#Module method
	def self.downloads

		link = "http://rubygems.org/api/v1/downloads.json"
		begin
			page_content = Net::HTTP.get(URI.parse(link))
		rescue
			abort "Internet Connection cannot be established"
		end
		#Exception handling
		begin
			data_file = JSON.parse(page_content)
		rescue
			abort "Check get data at the moment"
		end

		total = data_file["total"].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
		puts "Total Rubygems Downloads till date: #{total}"
	end

	def self.usergems(username)
		#Converts gemname to lowercase
		@username = username.to_s.downcase

		#http://rubygems.org/api/v1/owners/tushortz/gems.json
		
		#parse links
		@link = "http://rubygems.org/api/v1/owners/" + @username + "/gems.json"

		#Exception handling
		begin
			@page_content = Net::HTTP.get(URI.parse(@link))
		rescue
			abort "Internet Connection cannot be established"
		end

		#Exception handling
		begin
			@data_file = JSON.parse(@page_content)
		rescue
			abort "Check you have entered the right Username/ID"
		end

		totalgem = @data_file.is_a?(Hash)? 0 : @data_file.size
		
		# Checks if value can be converted to a number and assigns it to a value
		user = @username =~ /\A\d+\z/ ? "User ID" : "User Name"


		puts "#{user} : #{@username}"
		puts totalgem !=0? "Total gems: #{totalgem}\n\n" : "No gems found"
		
		begin
			i = 0; while i < @data_file.size
				keys = ["Gemname", "Overall downloads", "latest version", "Latest version downloads"]; 
				results = []
				@data_file[i].each{|x,y| 
					results << y
				}
				j = 0
				while j < 4
					puts "#{keys[j]}: #{results[j].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} " 
					j+=1
				end; puts ""
				i+=1
			end
		rescue 
			abort "Make sure #{user} is right and try again"
		end	

	end 


	def self.owner(gemname)
		#Converts gemname to lowercase
		@gemname = gemname.to_s.downcase

		#http://rubygems.org/api/v1/gems/event/owners.json
		
		#parse links
		@link = "http://rubygems.org/api/v1/gems/" + @gemname + "/owners.json"

		#Exception handling
		begin
			@page_content = Net::HTTP.get(URI.parse(@link))
		rescue
			abort "Internet Connection cannot be established"
		end

		#Exception handling
		begin
			@data_file = JSON.parse(@page_content)
		rescue
			abort "Check you have entered the right Gem's name"
		end

		puts "Gemname: #{@gemname} \n\n"
		for x in @data_file
			puts "User ID: #{x["id"]}"
			puts "Username: #{x["handle"]}"
			puts "Email Address: #{x["email"]} \n\n"
			
		end

	end 

	def self.search(query, *args)
		#Converts gemname to lowercase
		@query = query.to_s.downcase; @pageno = "1"

		unless args.size > 2
			@pageno = args[0].to_s
		else
			abort("Invalid parameters: must be 'query', | optional => page to display, amount per page |") 
		end
		#http://rubygems.org/api/v1/search.json?query=d&page=1
		#parse links
		@link = "http://rubygems.org/api/v1/search.json?query=" + @query + "&page=" + @pageno

		#Exception handling
		begin
			@page_content = Net::HTTP.get(URI.parse(@link))
		rescue
			abort "Internet Connection cannot be established"
		end

		#Exception handling
		begin
			@data_file = JSON.parse(@page_content)
		rescue
			abort "Search parameters are 'query' | optional => page to display, amount per page "
		end

		#Variable declaration and checks
		begin
			@amount = args.length == 2? args[1].to_i: @data_file.size
			@amount = @data_file.size if @amount > @data_file.size

			x=0; while x < @amount
				puts "Gem Name: #{@data_file[x]["name"]}"
				puts "Author: #{@data_file[x]["authors"]}"
				puts "Latest Version: #{@data_file[x]["version"]}"
				puts "Total Downloads: #{@data_file[x]["downloads"].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}\n\n"
				x+=1
			end
			#Show end of data
			puts "End of data" if @amount < 30
		rescue
			puts "Invalid arguments"
		end
	end

	#Module method
	def self.latestgems(amount=50)
		link = "http://rubygems.org/api/v1/activity/latest.json"

		begin
			page_content = Net::HTTP.get(URI.parse(link))
		rescue
			abort "Check get data at the moment"
		end

		#Exception handling
		begin
			@data_file = JSON.parse(page_content)
		rescue
			abort "Internet Connection cannot be established"
		end

		x=0; while x < amount.to_i
			puts "Gem Name: #{@data_file[x]["name"]}"
			puts "Author: #{@data_file[x]["authors"]}"
			puts "Latest Version: #{@data_file[x]["version"]}"
			puts "Total Downloads: #{@data_file[x]["downloads"].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
			puts "Description: #{@data_file[x]["info"]}\n\n"
			x+=1
		end
	end

	#Module method
	def self.updatedgems(amount=50)
		link = "http://rubygems.org/api/v1/activity/just_updated.json"

		begin
			page_content = Net::HTTP.get(URI.parse(link))
		rescue
			abort "Check get data at the moment"
		end

		#Exception handling
		begin
			@data_file = JSON.parse(page_content)
		rescue
			abort "Internet Connection cannot be established"
		end

		x=0; while x < amount.to_i
			puts "Gem Name: #{@data_file[x]["name"]}"
			puts "Author: #{@data_file[x]["authors"]}"
			puts "Latest Version: #{@data_file[x]["version"]}"
			puts "Total Downloads: #{@data_file[x]["downloads"].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
			puts "Description: #{@data_file[x]["info"]}\n\n"
			x+=1
		end
	end
end

