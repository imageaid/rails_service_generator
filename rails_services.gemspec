# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rake'
require_relative 'lib/rails_services/version'

Gem::Specification.new do |gem|
  gem.name          = 'rails_services'
  gem.version       = RailsServices::VERSION
  gem.authors       = ['Craig Kaminsky']
  gem.email         = ['imageaid@gmail.com']
  gem.summary       = %q{A Ruby gem that adds a rails generator for creating service classes.}
  gem.description   = %q{Speed up development when using a Service Layer by easily creating service classes and their attending test (gem) file.}
  gem.homepage      = 'https://github.com/imageaid/rails_service_generator'
  gem.license       = 'MIT'

  gem.files         = FileList['lib/*',
                                'bin/*',
                                'test/*'].to_a

  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = `git ls-files -- {test,gem,features}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'rails', '>= 4.2.0'

  gem.add_development_dependency 'rake', '>= 10.4.1'
  gem.add_development_dependency 'minitest', '> 5.0'
  gem.add_development_dependency 'minitest-reporters', '> 1.1.0'
end
