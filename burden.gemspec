$:.push File.expand_path('../lib', __FILE__)
require 'burden/version'

Gem::Specification.new do |spec|
  spec.name          = 'burden'
  spec.version       = Burden::VERSION
  spec.authors       = ['Gregory Eremin']
  spec.email         = ['magnolia_fan@me.com']
  spec.summary       = 'Rake tasks manager and statistics collector'
  spec.description   = 'Rake tasks manager and statistics collector'
  spec.homepage      = 'https://github.com/magnolia-fan/burden'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(/^bin\//){ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^spec\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rake'

  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'sqlite3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rails', '>= 3.1'
  spec.add_development_dependency 'rspec', '>= 2.0'
end
