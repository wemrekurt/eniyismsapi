$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "eniyismsapi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "eniyismsapi"
  s.version     = Eniyismsapi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Emre KURT"
  s.email       = ["emre.kurt@bil.omu.edu.tr"]
  s.description = "eniyisms.com api toplu sms rapor ve gonderim işlemleri icin hazirlanmistir"
  s.homepage    = "https://github.com/wemrekurt/eniyismsapi"
  s.summary     = "http://eniyisms.com/Api Eniyismsapi Ruby Gem."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "nokogiri", "~>1.6.6" , ">=1.6.6.3"
  s.add_dependency "rest-client","~>1.8", ">=1.8.0"
  s.add_dependency "crack", "~> 0.4", ">=0.4.2"

  # s.add_dependency "rails", "~> 4.2.6"
  # s.add_development_dependency "sqlite3"
end
