# frozen_string_literal: true

require_relative '../../../../test/test_helper'

class DestroyGeneratorTest < Rails::Generators::TestCase
  tests ::RailsServices::Generators::DestroyGenerator

  destination File.expand_path('../tmp', __dir__)

  setup do
    prepare_destination
    run_generator(%w[TestService ParentModel --sub_folder SubFolder])
  end

  test 'removes an initializer' do
    assert_no_file 'app/services/parent_models/sub_folder/test_service.rb'
  end
end
