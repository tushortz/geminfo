[![Gem Version](https://badge.fury.io/rb/geminfo.svg)](http://badge.fury.io/rb/geminfo)

# Geminfo


## Description
Geminfo is a Ruby package that allows you to see several information about a Gem like *Name, Author, UserID, SHA Key, Total downloads, Latest version, total gems owned by author, gem's release date* etc.

## Requirements
* Any version of Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geminfo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geminfo


## Module name --> Geminfo
It has one class called **"Stats"** and seven module methods **"gemversions"**, **"downloads"**, **"usergems"**, **"owner"**, **"search"**, **"latestgems"**, **"updatedgems"**.

### How to use


```ruby
require "geminfo"
```

## Module Class

### Stats
**Stats** has seventeen methods for showing different gem information. 

#### Methods

**Stats** takes only one argument **name** methods are:

* name() --> returns gem name.
* authors() --> return gem's Author names.
* total() --> return gem's total download for all versions.
* latest() --> return Gem's total download for latest version.
* latestversion() --> returns gem's latest version.
* info() --> returns gem's description.
* licenses() --> returns gem's licenses.
* metadata() --> returns gem's metadata.
* sha() --> returns gem's Secure Hash Algoruthm 256 Checksum.
* projectURL() --> returns gem's project URL.
* gemURL() --> returns gem's URL.
* homepage() --> returns gem's dedicated website.
* wikiURL() --> returns gem's wiki URL.
* docURL() --> returns gem's documentation URL.
* mailURL() --> returns gem's mailing list URL.
* sourceURL() --> returns gem's source-code URL.
* bugURL() --> returns gem's bug tracking URL.


#### Usage
You can use the *Stats* class in the following way:

##### Example

**One argument**

```ruby
sample = Geminfo::Stats.new("somegem")

puts "Name: #{sample.name()}"
puts "Authors: #{sample.authors()}"
puts "Total downloads: #{sample.total()}"
puts "Latest version total: #{sample.latest()}"
puts "Latest version: #{sample.latestversion()}"
puts "Info: #{sample.info()}"
puts "Licenses: #{sample.licenses()}"
puts "Metadata: #{sample.metadata()}"
puts "Sha key: #{sample.sha()}"
puts "Project URL: #{sample.projectURL()}"
puts "Gem URL: #{sample.gemURL()}"
puts "Homepage: #{sample.homepage()}"
puts "Wiki URL: #{sample.wikiURL()}"
puts "documentation URL: #{sample.docURL}"
puts "Mailing list: #{sample.mailURL}"
puts "Soure code URL: #{sample.sourceURL}"
puts "Bugs Tracker: #{sample.bugURL}"

#Alternative (this will give the same result).
#puts Geminfo::Stats.new("somegem").name
#puts Geminfo::Stats.new("somegem").authors 	#etc.
```

##### Result

```ruby
Name: somegem
Authors: Daffy Duck
Total downloads: 1,051,815,917
Latest version total: 1,328,554
Latest version: 4.1.0
Info: somegem has been built to train Daffy duck and co for heroic acts.
Licenses: ["MIT"]
Metadata: empty metadata
Sha key: 6a19b32cf92ac3585cbffe2f5356642e84349abf55ee82827313ec3c707843ec
Project URL: http://rubygems.org/gems/somegem
Gem URL: http://rubygems.org/gems/somegem-4.1.0.gem
Homepage: http://www.daffy.org
Wiki URL: http://wiki.daffywiki.org
documentation URL: http://api.daffy.org
Mailing list: http://groups.google.com/group/duck-quack
Soure code URL: http://github.com/daffy/somegem
Bugs Tracker: http://github.com/daffy/somegem/issues
```

## Module Methods
> **Note:** All module methods are self printing so there is no need to use the printing method only except if you wish to.

### gemversions
**gemversions** takes one argument (**gemname**). It shows the *gem version, author, build date, total downloads and secure hash algorithm* of all the versions of a gem. 

#### Usage
You can use the *gemversions* method in the following way:

##### Example
```ruby
Geminfo.gemversions("somegem")
```

##### Result

```ruby
Gemname: somegem-1.0.1
Authors: Daffy Duck
Built on: 2006-12-15
Total downloads: 2504
SHA 256 Checksum: 795942397a9854969cd5b9a9e68c7138f7111e5ae96b6166099b952d68006b4a

Gemname: somegem-1.0.0
Authors: Daffy Duck
Built on: 2006-10-13
Total downloads: 2310
SHA 256 Checksum: 593f193c332355264c289ff2065ea2e91d1095888d50147a7fdee41fad058b9e

```

### downloads
**downloads** takes no argument. It shows the total downloads of all Rubygems till date.

#### Usage
You can use the *downloads* method in the following way:

##### Example
```ruby
Geminfo.downloads()
```

##### Result

```ruby
Total Rubygems Downloads till date: 5,709,711,396
```


### usergems
**usergems** take one argument **username/userID**. It shows some information *(total gems, gems, overall downloads, gem's latest version and overall downloads)* about all the gems of a specified user.

#### Usage
You can use the *usergems* method in the following ways:

##### Example 1
**Using Username**

```ruby
Geminfo.usergems("daffy")
```

##### Result 1

```ruby
Username: daffy
Total gems: 2

Gemname: ducks 
Overall downloads: 483 
latest version: 0.0.1 
Latest version downloads: 483 

Gemname: ducklings 
Overall downloads: 1,443 
latest version: 0.0.2 
Latest version downloads: 493
```

##### Example 2
**Using ID**

```ruby
Geminfo.usergems(12345)	
```

##### Result 2

```ruby
User ID : 12345		
Total gems: 1

Gemname: ducks 
Overall downloads: 203 
latest version: 0.0.2 
Latest version downloads: 100  
```

### owner
**owner** takes one argument **gemname**. It displays some information (total gems, gems, overall downloads, gem's latest version and about all the gems of the specified user.

#### Usage
You can use the *owner* method in the following way:

##### Example
```ruby
Geminfo.usergems("ducks")
```

##### Result

```ruby
Gemname: ducks 

User ID: 12345
Username: daffy
Email Address: daffy@ducks.quack
```

### search
**search** takes *one* to *three* arguments. The first and compulsory one being the **query parameter**. It also takes another optional argument being **page number** and a third being the **amount of items** to be displayed from a page. The default is 30 items. 

> **Tip:** The optional parameters helps you to refine your search result.


#### Usage
You can use the *search* method in the following ways:

##### Example 1

**One argument**

```ruby
Geminfo.search("man")
```

##### Result 1

```ruby
Gem Name: batman
Author: Bruce Wayne
Latest Version: 0.2.4
Total Downloads: 47,342

Gem Name: spiderman
Author: Peter Parker
Latest Version: 1.20.0
Total Downloads: 742,616

Gem Name: superman
Author: Clark Kent
Latest Version: 0.6.0
Total Downloads: 457,848

...

```
> and so many more results

##### Example 2

**Two arguments**

```ruby
Geminfo.search("at", 5)
```
> opens page 5 of the search query result of "at"

##### Result 2

```ruby
Gem Name: rat
Author: Jerry Mouse
Latest Version: 0.2.4
Total Downloads: 47,342

Gem Name: cat
Author: Tom Cat
Latest Version: 1.20.0
Total Downloads: 742,616

Gem Name: fat
Author: Humpty Dumpty
Latest Version: 0.6.0
Total Downloads: 457,848

...
```

>and so many more results up to 30


##### Example 3

**Three arguments**

```ruby
Geminfo.search("at", 5, 1)
```
> opens page 5 of the search term "at"

##### Result 3

```ruby
Gem Name: rat
Author: Jerry Mouse
Latest Version: 0.2.4
Total Downloads: 47,342

```
> Shows the nth amount of items (*argument three*) of page 5. (In this case **rat**)


### latestgems
**latestgems** takes *zero* arguments but an optional argument(**amount to show**) can be passed to it. The default items to show is 50. It shows the latest gems on the Rubygems website.

> **Tip:** The optional parameter helps you to refine your search result.


#### Usage
You can use the *latestgems* method in the following ways:

##### Example 1

**No arguments**

```ruby
Geminfo.latestgems()
```

##### Result 1

```ruby
Gem Name: newruby
Author: Ruby Miner
Latest Version: 0.1.0
Total Downloads: 4
Description: A simple Ruby miner who loves gems.

Gem Name:newgold
Author: Gold Digger
Latest Version: 1.0
Total Downloads: 10
Description: A simple gold digger who needs nothing but money.

Gem Name: newdiamond
Author: Diamond Thief
Latest Version: 0.0.3
Total Downloads: 17
Description: Gold gold and gold is precious
...

```
>and so many more results --> Up to 50

##### Example 2

**One argument**

```ruby
Geminfo.latestgems(1)
```
> Shows only the first result

##### Result 2

```ruby
Gem Name: newruby
Author: Ruby Miner
Latest Version: 0.1.0
Total Downloads: 4
Description: A simple Ruby miner who loves gems.

```
> and so many more results


### updatedgems
**updatedgems** takes *zero* arguments but an optional argument(**amount to show**) can be passed to it. The default items to show is 50. It shows the recently updated gems on the Rubygems website.

> **Tip:** The optional parameter helps you to refine your search result.


#### Usage
You can use the *updatedgems* method in the following ways:

##### Example 1

**No arguments**

```ruby
Geminfo.updatedgems()
```

##### Result 1

```ruby
Gem Name: newruby
Author: Ruby Miner
Latest Version: 0.1.1
Total Downloads: 4
Description: An update to a simple Ruby miner who loves gems.

Gem Name: newgold
Author: Gold Digger
Latest Version: 1.1
Total Downloads: 10
Description: An update to a simple gold digger who needs nothing but money.

Gem Name: newdiamond
Author: Diamond Thief
Latest Version: 0.1.3
Total Downloads: 17
Description: An update to Gold gold and gold is precious
...

```
> and so many more results --> Up to 50

##### Example 2

**One argument**

```ruby
Geminfo.latestgems(1)
```
> Shows only the first result

##### Result 2

```ruby
Gem Name: newruby
Author: Ruby Miner
Latest Version: 0.1.1
Total Downloads: 4
Description: An update to a simple Ruby miner who loves gems.

```
> and so many more results


-----



<!-- ## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
 -->
## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/tushortz/geminfo). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://.contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

**Copyright © 2015 Taiwo Kareem**
