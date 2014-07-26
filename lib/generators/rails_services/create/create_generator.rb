module RailsServices
  module Generators
    class CreateGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :service_name, type: :string
      argument :parent_name, type: :string
      argument :sub_folder, type: :string, default: ''

      def create_service
        template 'base_service.rb.erb', "app/services/#{service_directory}/#{service_file}"
        template 'base_service_spec.rb.erb', "spec/services/#{service_directory}/#{spec_file}"
      end

      private
      def service_directory
        file_path = "#{parent_name.underscore}"
        file_path += "/#{sub_folder.underscore}" if sub_folder.present?
        file_path
      end

      def service_file
        "#{service_name.underscore}.rb"
      end

      def spec_file
        "#{service_name.underscore}_spec.rb"
      end

      def qualified_name
        name = "#{parent_name.camelize}::"
        name += "#{sub_folder.camelize}::" if sub_folder.present?
        name += "#{service_name.camelize}"
        name
      end
    end
  end
end