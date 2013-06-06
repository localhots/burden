$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "burden_web/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "burden_web"
  s.version     = BurdenWeb::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of BurdenWeb."
  s.description = "TODO: Description of BurdenWeb."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '>= 3.2'
  s.add_development_dependency 'burden'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'awesome_print'
end
