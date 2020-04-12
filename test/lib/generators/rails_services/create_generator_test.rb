# frozen_string_literal: true

require_relative '../../../../test/test_helper'

class CreateGeneratorTest < Rails::Generators::TestCase
  tests ::RailsServices::Generators::CreateGenerator

  destination File.expand_path('../tmp', __dir__)

  setup do
    prepare_destination
  end

  test 'generates a service class' do
    run_generator(%w[TestBaseService ParentModel --sub_folder SubFolder])
    assert_file 'app/services/base_service.rb'
    assert_file 'app/services/parent_models/sub_folder/test_base_service.rb'
  end
end
