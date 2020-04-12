require_relative '../../../lib/rails_services/nameable'
require_relative '../../../lib/rails_services/fileable'

module RailsServices
  class Generators
    ##
    # generates a form object
    class FormGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      include Nameable
      include Fileable

      argument :object_name, type: :string, required: true
      argument :parent_name, type: :string, required: true

      class_option :sub_folder, type: :string, default: ''
      class_option :accessors, type: :array, default: []

      def create_form
        template 'base_form.rb.erb', "app/forms/#{object_directory}/#{form_object_file}"
        create_test
      end

      private

      def create_test
        if File.exist?('spec/spec_helper.rb')
          template 'base_form_spec.rb.erb', "spec/forms/#{object_directory}/#{form_spec_file}"
        else
          template 'base_form_unit_test.rb.erb', "test/forms/#{object_directory}/#{form_unit_file}"
        end
      end
    end
  end
end
