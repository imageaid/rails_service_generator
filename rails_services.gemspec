# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rake'
require_relative 'lib/rails_services/version'

Gem::Specification.new do |gem|
  gem.name          = 'rails_services'
  gem.version       = RailsServices::VERSION
  gem.authors       = ['Craig Kaminsky']
  gem.email         = ['imageaid@gmail.com']
  gem.summary       = 'A Ruby gem that adds a rails generator for creating service classes.'
  gem.description   = 'Speed up development when using a Service Layer by easily creating service classes and their attending test (gem) file.'
  gem.homepage      = 'https://github.com/imageaid/rails_service_generator'
  gem.license       = 'MIT'

  gem.files         = Dir.glob('{bin,lib}/**/*') + %w[LICENSE.txt README.md CHANGELOG.md]

  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = `git ls-files -- {test,gem,features}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'rails', '> 4', '< 7'

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'minitest-reporters'
  gem.add_development_dependency 'rake'
end
