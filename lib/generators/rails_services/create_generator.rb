module RailsServices
  class Generators
    class CreateGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :service_name, type: :string
      argument :parent_name, type: :string
      argument :sub_folder, type: :string, default: ''

      hook_for :test_framework do |framework|
        if test_framework.try(:downcase) == 'rspec'
          template 'base_service_spec.rb.erb', "spec/services/#{service_directory}/#{spec_file}"
        else
          template 'base_service_spec.rb.erb', "test/services/#{service_directory}/#{unit_file}"
        end
      end

      def create_service
        template 'base_service.rb.erb', "app/services/#{service_directory}/#{service_file}"
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

      def unit_file
        "#{service_name.underscore}_test.rb"
      end

      def qualified_name
        name = "#{parent_name.camelize}::"
        name += "#{sub_folder.camelize}::" if sub_folder.present?
        name += "#{service_name.camelize}"
        name
      end

      def module_name
        "#{parent_name.camelize}"
      end

      def subfolder_name
        "#{sub_folder.try(:camelize)}"
      end

      def class_name
        "#{service_name.camelize}"
      end
    end
  end
end