$:.push File.expand_path('../lib', __FILE__)
require 'burden_web/version'

Gem::Specification.new do |spec|
  spec.name        = 'burden_web'
  spec.version     = BurdenWeb::VERSION
  spec.authors     = ['Gregory Eremin']
  spec.email       = ['magnolia_fan@me.com']
  spec.summary     = 'A web interface for Burden'
  spec.description = 'Burden is a manager and statistics collector for Rake tasks. It comes with this web interface.'
  spec.homepage    = 'https://github.com/magnolia-fan/burden'
  spec.license     = 'MIT'

  spec.files       = `git ls-files`.split($/)
  spec.executables = spec.files.grep(/^bin\//){ |f| File.basename(f) }
  spec.test_files  = spec.files.grep(/^spec\//)

  spec.add_dependency 'rails', '>= 3.2'
  spec.add_development_dependency 'burden', "= #{BurdenWeb::VERSION}"

  spec.add_development_dependency 'sqlite3', '>= 0'
  spec.add_development_dependency 'awesome_print', '>= 0'
end
