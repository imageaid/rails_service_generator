require_relative '../../../../test/test_helper'

class CreateGeneratorTest < Rails::Generators::TestCase
  tests ::RailsServices::Generators::CreateGenerator

  destination File.expand_path('../../tmp', __FILE__)

  setup do
    prepare_destination
  end

  test 'generates an old style service class' do
    run_generator(%w(TestService ParentModel SubFolder --style old))
    assert_file 'app/services/parent_models/sub_folder/test_service.rb'
  end

  test 'generates a new style service class' do
    run_generator(%w(TestBaseService ParentModel SubFolder --style new))
    assert_file 'app/services/base_service.rb'
    assert_file 'app/services/parent_models/sub_folder/test_base_service.rb'
  end

end