$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rake_control_web/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rake_control_web"
  s.version     = RakeControlWeb::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RakeControlWeb."
  s.description = "TODO: Description of RakeControlWeb."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rake_control"
end
