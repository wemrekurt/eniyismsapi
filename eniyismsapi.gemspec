$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "eniyismsapi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "eniyismsapi"
  s.version     = Eniyismsapi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["wemrekurt"]
  s.email       = ["emre.kurt@bil.omu.edu.tr"]
  s.homepage    = "TODO"
  s.summary     = "http://eniyisms.com/Api Eniyismsapi Ruby Gem."
  s.description = "TODO: Description of Eniyismsapi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
