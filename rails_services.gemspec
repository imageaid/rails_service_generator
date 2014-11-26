# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'rails_services'
  spec.version       = '1.0.5'
  spec.authors       = ['Craig Kaminsky']
  spec.email         = ['imageaid@gmail.com']
  spec.summary       = %q{A Ruby gem that adds a rails generator for creating service classes.}
  spec.description   = %q{Speed up development when using a Service Layer by easily creating service classes and their attending test (spec) file.}
  spec.homepage      = 'https://github.com/imageaid/rails_service_generator'
  spec.license       = 'MIT'

  spec.files         = FileList['lib/*',
                                'bin/*',
                                'test/*'].to_a
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '~> 3.2'
  spec.add_runtime_dependency 'rails', '~> 3.2'

  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'minitest', '~> 5.4'
end
