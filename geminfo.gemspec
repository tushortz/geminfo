# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geminfo'

Gem::Specification.new do |spec|
  spec.name          = "geminfo"
  spec.version       = Geminfo::VERSION
  spec.authors       = ["Taiwo Kareem"]
  spec.email         = ["taiwo.kareem36@gmail.com"]
  spec.summary       = %q{A Ruby package that displays several statistics of your RubyGem}
  spec.description   = %q{A Ruby package that displays several information about a RubyGem like author, total downloads, latest version, user ID, sha key, total gems owned by authors, release date etc.}
  spec.homepage      = "https://github.com/tushortz/geminfo"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1"
  spec.add_development_dependency "rake", "~> 10.0"
 
end
