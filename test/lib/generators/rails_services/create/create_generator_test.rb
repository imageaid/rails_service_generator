require 'rails'
require 'rails/generators'
require 'generators/rails_services/create/create_generator'

class CreateGeneratorTest < Rails::Generators::TestCase
  tests ::RailsServices::Generators::Create::CreateGenerator

  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test 'generates a service' do
    run_generator(%w(TestService ParentModel SubFolder))
    assert_file 'test_service.rb'
  end

end