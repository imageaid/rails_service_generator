require 'rails/generators'

module RailsServices
  module Generators
    class DestroyGenerator < Rails::Generators::Base
      argument :service_name, type: :string
      argument :parent_name, type: :string
      argument :sub_folder, type: :string, default: ''

      def destroy_service
        remove_file "app/services/#{full_service_directory}/#{service_file}"
        remove_file "spec/services/#{full_service_directory}/#{spec_file}"

        manage_containing_directories('app', 'spec')
      end

      private
      def full_service_directory
        file_path = "#{service_parent_directory}"
        file_path += "/#{sub_folder.underscore}" if sub_folder.present?
        file_path
      end

      def service_parent_directory
        "#{parent_name.underscore}"
      end

      def service_file
        "#{service_name.underscore}.rb"
      end

      def spec_file
        "#{service_name.underscore}_spec.rb"
      end

      def manage_containing_directories(*directory_types)
        directory_types.each do |directory_type|
          remove_dir("#{directory_type}/services/#{full_service_directory}") if directory_empty?(directory_type)
          remove_dir("#{directory_type}/services/#{service_parent_directory}") if parent_directory_empty?(directory_type)
        end
      end

      def directory_empty?(directory_type)
        Dir["#{Rails.root}/#{directory_type}/services/#{full_service_directory}/*"].empty?
      end

      def parent_directory_empty?(directory_type)
        Dir["#{Rails.root}/#{directory_type}/services/#{service_parent_directory}/*"].empty?
      end

    end
  end
end