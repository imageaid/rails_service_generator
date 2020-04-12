# frozen_string_literal: true

require_relative '../../../../test/test_helper'

class FormGeneratorTest < Rails::Generators::TestCase
  tests ::RailsServices::Generators::FormGenerator

  destination File.expand_path('../tmp', __dir__)

  setup do
    prepare_destination
  end

  test 'generates a base form object' do
    run_generator(%w[TestFormObject Parent --accessors first_name last_name])
    assert_file 'app/forms/parents/test_form_object_form.rb'
  end

  test 'generates a subfoldered form object' do
    run_generator(%w[TestFormObject Parent --sub_folder Child --accessors first_name last_name])
    assert_file 'app/forms/parents/child/test_form_object_form.rb'
  end
end
