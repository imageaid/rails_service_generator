require 'rails'
require 'rails/generators'
require '../../../../../lib/generators/rails_services/destroy/destroy_generator'

class DestroyGeneratorTest < Rails::Generators::TestCase
  tests RailsServices::Generators::DestroyGenerator

  destination File.expand_path('../../tmp', __FILE__)

  setup :prepare_destination

  test 'removes an initializer' do
    run_generator(%w(TestService ParentModel SubFolder))
    assert_file 'app/services/parent_model/sub_folder/test_service.rb'
  end

end