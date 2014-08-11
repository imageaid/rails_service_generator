require 'test/minitest_helper'

class CreateGeneratorTest < Rails::Generators::TestCase
  tests ::RailsServices::Generators::CreateGenerator

  destination File.expand_path('../../tmp', __FILE__)

  setup do
    prepare_destination
    run_generator(%w(TestService ParentModel SubFolder))
  end

  test 'generates a service class' do
    assert_file 'app/services/parent_model/sub_folder/test_service.rb'
  end

end