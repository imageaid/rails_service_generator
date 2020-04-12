# RailsServices

[![Code Climate](https://codeclimate.com/github/imageaid/rails_service_generator.png)](https://codeclimate.com/github/imageaid/rails_service_generator) 
[![Gem Version](https://badge.fury.io/rb/rails_services.svg)](http://badge.fury.io/rb/rails_services)  

A gem for Rails that adds a generator for easily creating a service class and/or form object and its accompanying spec or test unit file.

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

    $ [bundle exec] rails generate rails_services:create Service ParentFolder --sub_folder SubFolder [opt]
    
    $ [bundle exec] rails generate rails_services:destroy Service ParentFolder --sub_folder SubFolder [opt]
    
    $ [bundle exec] rails generate rails_services:form Form ParentFolder --sub_folder SubFolder [opt] --accessors name email [opt]

## v3.0.0 CHANGES AND REMOVALS   
### CHANGES
There are four primary changes in version 3: 

1. All services have `include BaseService` 
2. The `call` method is an instance method rather than a class method
3. You may generate a `Form` model
4. An updated command line interface (see below)

#### Updated command line interface
Previous versions of the gem used plain old arguments to create or destroy the appropriate files. Over time, this became more unwieldy than imagined. From version 3.0.0 forward, there are only two arguments: `object_name` and `parent_name`. Additionally, the previously available optional argument, `instance`, was removed (see REMOVALS section, below).

If you would like to add a sub-folder to the service or form, you can now provide the `class_option` for it: `--sub_folder NAME_OF_FOLDER`. Similarly, for the form generator, you can pass in an array of `attr_accessors` with  the following: `--accessors accessor_1_name accessor_2_name ...` (use regular strings as these will be 'converted' to symbols). 

### REMOVALS: 
There was one significant removal from the gem: 

1. No more `instance` argument in the command line interface (see below)

#### Instance argument dropped
An instance argument was added in v2.0.0 which allowed users to choose what style of service class to create. The gem defaulted to using this new style. 

While the v2.x line continued to allow users a choice between the old and new^ styles, the v3.x line removes this choice. All services will be created with the now-not-so-new style. BE AWARE :)!

^The new style creates service clases inherited from a `BaseService` class; allows for optional instantiation of the service (`Service.new(args*).call`), and uses an instance method for `call`. 

## NOTES 
## Upgrading to current service class style 
Should you want to update your older/previously built services with this 'new' style, you only need to do the following:

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

### Sub-folders
Sub-folders are optional but, at this time, you may only use one sub-folder. I generally only use the sub-folders when I have a naturally grouped set of services.

## Generator results
### Create service and create form
Two files are created: the requested class and either a spec or test class, based on your testing framework (minitest or rspec).

For services: 

+ app/services/[parent-folder]/[sub-folder]/thing.rb
+ spec/services/[parent-folder]/[sub-folder]/thing_spec.rb OR
+ test/services/[parent-folder]/[sub-folder]/thing_test.rb

For forms: 

+ app/forms/[parent-folder]/[sub-folder]/thing_form.rb
+ spec/forms/[parent-folder]/[sub-folder]/thing_form_spec.rb OR
+ test/forms/[parent-folder]/[sub-folder]/thing_form_test.rb

### Destroy service
Pretty simple here ... it just removes the files it created!

## Contributing
1. Fork it ( https://github.com/imageaid/rails_services/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
