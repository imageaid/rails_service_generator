module RailsServices
  ##
  # commonly used naming conventions
  module Nameable
    def qualified_name
      name = "#{parent_name.pluralize.camelize}::"
      name += "#{options['sub_folder'].camelize}::" if options['sub_folder'].present?
      name += object_name.camelize.to_s
      name
    end

    def module_name
      parent_name.pluralize.camelize.to_s
    end

    def subfolder_name
      options['sub_folder'].try(:camelize).to_s
    end

    def service_class_name
      object_name.camelize.to_s
    end

    def form_class_name
      "#{object_name.camelize.to_s}Form"
    end
  end
end
