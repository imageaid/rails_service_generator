require_relative '../../../../test/test_helper'

class DestroyGeneratorTest < Rails::Generators::TestCase
  tests ::RailsServices::Generators::DestroyGenerator

  destination File.expand_path('../../tmp', __FILE__)

  setup do
    prepare_destination
    run_generator(%w(TestService ParentModel SubFolder))
  end

  test 'removes an initializer' do
    assert_no_file 'app/services/parent_model/sub_folder/test_service.rb'
  end

end