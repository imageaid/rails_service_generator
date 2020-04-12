require_relative '../../../lib/rails_services/nameable'
require_relative '../../../lib/rails_services/fileable'

module RailsServices
  class Generators
    ##
    # creates a service class
    class CreateGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      include Nameable
      include Fileable

      argument :object_name, type: :string
      argument :parent_name, type: :string

      class_option :sub_folder, type: :string, default: ''

      def create_service
        copy_base_service_class
        template 'base_service_new.rb.erb', "app/services/#{object_directory}/#{service_object_file}"
        create_test
      end

      private

      def copy_base_service_class
        template('base_service_class.rb.erb', 'app/services/base_service.rb') unless File.exist?('app/services/base_service.rb')
      end

      def create_test
        if File.exist?('spec/spec_helper.rb')
          template 'base_service_spec.rb.erb', "spec/services/#{object_directory}/#{service_spec_file}"
        else
          template 'base_service_unit_test.rb.erb', "test/services/#{object_directory}/#{service_unit_file}"
        end
      end
    end
  end
end
