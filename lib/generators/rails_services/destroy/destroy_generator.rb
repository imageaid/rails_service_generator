module RailsServices
  module Generators
    class DestroyGenerator < Rails::Generators::Base
      argument :service_name, type: :string
      argument :parent_name, type: :string
      argument :sub_folder, type: :string, default: ''

      def destroy_service
        remove_file "app/services/#{service_file_path}"
        remove_file "spec/services/#{spec_file_path}"
      end

      private
      def service_file_path
        file_and_path = "#{parent_name.underscore}/"
        file_and_path += "#{sub_folder.underscore}/" if sub_folder.present?
        file_and_path += "#{service_name.underscore}.rb"
        file_and_path
      end

      def spec_file_path
        file_and_path = "#{parent_name.underscore}/"
        file_and_path += "#{sub_folder.underscore}/" if sub_folder.present?
        file_and_path += "#{service_name.underscore}_spec.rb"
        file_and_path
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