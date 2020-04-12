# RailsServices

[![Code Climate](https://codeclimate.com/github/imageaid/rails_service_generator.png)](https://codeclimate.com/github/imageaid/rails_service_generator) 
[![Gem Version](https://badge.fury.io/rb/rails_services.svg)](http://badge.fury.io/rb/rails_services)  

A simple gem for Rails that adds a generator for easily creating a service class and/or form object and its accompanying spec or test unit file.

## Requirements 

Rails 4 and higher

## Installation

Add this line to your application's Gemfile:

    gem 'rails_services'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_services

## Usage

Examples: 

    $ rails generate rails_services:create Service Model|Controller --sub_folder Sub-folder [opt]
    
    $ rails generate rails_services:destroy Service Model|Controller --sub_folder Sub-folder [opt]
    
    $ rails generate rails_services:form Form Model|Controller --sub_folder Sub-folder [opt] --accessors name email [opt]

## CHANGES AND NOTES    
### Notes: Sub-folders
Sub-folders are optional but, at this time, you may only use one sub-folder. I generally use the sub-folders when I have a naturally grouped set of services.

### Changes: new argument structure for the command line
Previous versions of the gem used plain old arguments to create or destroy the appropriate files. Over time, this became
more unwieldy than imagined. From version 3.0.0 forward, there are only two arguments: `object_name` and `parent_name`. 

If you would like to add a sub-folder to the service or form, you can now provide the `class_option` for it: 
`--sub_folder NAME_OF_FOLDER`. Similarly, for the form generator, you can pass in an array of `attr_accessors` with 
the following: `--accessors accessor_1_name accessor_2_name ...`. 

### Changes: Instance Argument REMOVED
An instance argument was added in version 2.0.0. While the version 2.x line allowed users to choose between the old and new style, 
(new = service clases inherited from a `BaseService` class and instantiated the service), the version 3.x line removes this option. BE AWARE :). 

## Upgrading
There are two primary changes in version 3: 

First, all services now include the `BaseService` class and methods in the services are, 
by default, instance methods rather than class methods. 

Second, the gem now allows you to generate a `Form` object/model.  

**Converting Old Service Classes** - Should you want to update your older/previously built services with this approach, 
you only need to do the following:

     # include the base service in your class
     class ClassName
       include BaseService

     # Then ... optionally, add an initialize method 
     def initialize(*args)
       # ... 
       super
     end
     
     # Finally, change the method signatures, simply removing `self.` from the definition(s), as follows: 
     def self.call
       # ...
     end
     # becomes
     def call
       # ...
     end
     # and so on for other, similarly defined methods

## Generator Result (create service and create form)

Two files are created (spec or test based on your `test_framework`).

For services: 

+ app/services/model|controller/[sub-folder]/thing.rb
+ spec/services/model|controller/[sub-folder]/thing_spec.rb
+ test/services/model|controller/[sub-folder]/thing_test.rb

For forms: 

+ app/forms/model|controller/[sub-folder]/thing_form.rb
+ spec/forms/model|controller/[sub-folder]/thing_form_spec.rb
+ test/forms/model|controller/[sub-folder]/thing_form_test.rb

## Generator Result (destroy service)

Pretty simple here ... it just removes the files it created

## Contributing

1. Fork it ( https://github.com/imageaid/rails_services/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
