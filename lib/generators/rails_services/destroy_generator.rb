require_relative '../../../lib/rails_services/nameable'
require_relative '../../../lib/rails_services/fileable'

module RailsServices
  class Generators
    ##
    # destroys a service class
    class DestroyGenerator < Rails::Generators::Base
      include Nameable
      include Fileable

      argument :object_name, type: :string
      argument :parent_name, type: :string

      class_option :sub_folder, type: :string, default: ''

      def destroy_service
        remove_file "app/services/#{full_object_directory}/#{service_object_file}"
        remove_file "spec/services/#{full_object_directory}/#{service_spec_file}"
        remove_file "test/services/#{full_object_directory}/#{service_unit_file}"

        manage_containing_directories('app', 'spec', 'test')
      end

      private

      def full_object_directory
        file_path = service_parent_directory.to_s
        file_path += "/#{options['sub_folder'].underscore}" if options['sub_folder'].present?
        file_path
      end

      def service_parent_directory
        parent_name.pluralize.underscore.to_s
      end

      def manage_containing_directories(*directory_types)
        directory_types.each do |directory_type|
          remove_dir("#{directory_type}/services/#{full_object_directory}") if directory_empty?(directory_type)
          remove_dir("#{directory_type}/services/#{service_parent_directory}") if parent_directory_empty?(directory_type)
        end
      end

      def directory_empty?(directory_type)
        Dir["#{Rails.root}/#{directory_type}/services/#{full_object_directory}/*"].empty?
      end

      def parent_directory_empty?(directory_type)
        Dir["#{Rails.root}/#{directory_type}/services/#{service_parent_directory}/*"].empty?
      end
    end
  end
end
