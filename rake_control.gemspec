lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake_control/version'

Gem::Specification.new do |spec|
  spec.name          = 'rake_control'
  spec.version       = RakeControl::VERSION
  spec.authors       = ['Gregory Eremin']
  spec.email         = ['magnolia_fan@me.com']
  spec.description   = %q{}
  spec.summary       = %q{Rake tasks manager and statistics collector}
  spec.homepage      = 'https://github.com/magnolia-fan/rake_control'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rake'
  spec.add_runtime_dependency 'activerecord'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rspec-rails'
end
