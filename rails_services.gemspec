# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_services/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_services'
  spec.version       = RailsServices::VERSION
  spec.authors       = ['Craig Kaminsky']
  spec.email         = ['imageaid@gmail.com']
  spec.summary       = %q{A Ruby gem that adds a rails generator for creating service classes.}
  spec.description   = %q{Speed up development when using a Service Layer by easily creating service classes and their attending test (spec) file.}
  spec.homepage      = 'https://github.com/imageaid/rails_service_generator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 3.2.19'
  spec.add_dependency 'rails', '>= 3.2.19'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
