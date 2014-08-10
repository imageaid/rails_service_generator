require 'rails'
require 'rails/generators'
require '../../../../../lib/generators/rails_services/create/create_generator'

class CreateGeneratorTest < Rails::Generators::TestCase
  tests RailsServices::Generators::CreateGenerator

  destination File.expand_path('../../tmp', __FILE__)

  setup :prepare_destination

  test 'Generates an initializer' do
    run_generator(%w(TestService ParentModel SubFolder))
    assert_file 'app/services/parent_model/sub_folder/test_service.rb'
  end

end