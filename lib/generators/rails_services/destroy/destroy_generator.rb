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
        remove_dir("app/services/#{full_service_directory}")
        remove_dir("spec/services/#{full_service_directory}")
        # directory_types.each do |directory_type|
        #   if Dir["#{Rails.root}/#{directory_type}/services/#{full_service_directory}/*"].empty?
        #     Dir.delete(Dir["#{Rails.root}/#{directory_type}/services/#{full_service_directory}"])
        #     manage_parent_directory(directory_type) if sub_folder.present?
        #   end
        # end
      end

      def manage_parent_directory(directory_type)
        if Dir["#{Rails.root}/#{directory_type}/services/#{service_parent_directory}/*"].empty?
          Dir.delete(Dir["#{Rails.root}/#{directory_type}/services/#{service_parent_directory}"])
        end
      end

    end
  end
end