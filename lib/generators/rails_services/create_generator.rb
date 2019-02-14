module RailsServices
  class Generators
    ##
    # creates a service class
    class CreateGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      argument :service_name, type: :string
      argument :parent_name, type: :string
      argument :sub_folder, type: :string, default: ''
      argument :instance, type: :string, default: 'yes'

      def create_service
        if instance == 'yes'
          copy_base_service_class
          template 'base_service_new.rb.erb', "app/services/#{service_directory}/#{service_file}"
        else
          template 'base_service_old.rb.erb', "app/services/#{service_directory}/#{service_file}"
        end
        create_test
      end

      private

      def copy_base_service_class
        template('base_service.rb.erb', 'app/services/base_service.rb') unless File.exist?('app/services/base_service.rb')
      end

      def create_test
        if File.exist?('spec/spec_helper.rb')
          template 'base_service_spec.rb.erb', "spec/services/#{service_directory}/#{spec_file}"
        else
          template 'base_service_unit_test.rb.erb', "test/services/#{service_directory}/#{unit_file}"
        end
      end

      def service_directory
        file_path = parent_name.pluralize.underscore.to_s
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
        name = "#{parent_name.pluralize.camelize}::"
        name += "#{sub_folder.camelize}::" if sub_folder.present?
        name += service_name.camelize.to_s
        name
      end

      def module_name
        parent_name.pluralize.camelize.to_s
      end

      def subfolder_name
        sub_folder.try(:camelize).to_s
      end

      def class_name
        service_name.camelize.to_s
      end
    end
  end
end
