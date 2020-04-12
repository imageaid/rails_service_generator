module RailsServices
  ##
  # handles creating files and directories
  module Fileable
    def object_directory
      file_path = parent_name.pluralize.underscore.to_s
      file_path += "/#{options['sub_folder'].underscore}" if options['sub_folder'].present?
      file_path
    end

    # services
    def service_object_file
      "#{object_name.underscore}.rb"
    end

    def service_spec_file
      "#{object_name.underscore}_spec.rb"
    end

    def service_unit_file
      "#{object_name.underscore}_test.rb"
    end

    # forms
    def form_object_file
      "#{object_name.underscore}_form.rb"
    end

    def form_spec_file
      "#{object_name.underscore}_form_spec.rb"
    end

    def form_unit_file
      "#{object_name.underscore}_form_test.rb"
    end
  end
end
