$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "orderable2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "orderable2"
  s.version     = Orderable2::VERSION
  s.authors     = ["Lukas_Skywalker"]
  s.email       = ["lukas.diener@hotmail.com"]
  s.homepage    = "https://code-fabrik.ch/gems/orderable2"
  s.summary     = "Let users define order rules for records"
  s.description = "Allows to set the order of AR queries using URL parameters"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "pg"
end
