# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_services/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_services'
  spec.version       = RailsServices::VERSION
  spec.authors       = ['Craig Kaminsky']
  spec.email         = ['imageaid@gmail.com']
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '> 3.2.19'
  spec.add_dependency 'rails', '> 3.2.19'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
