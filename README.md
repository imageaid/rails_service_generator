# RailsServices

[![Code Climate](https://codeclimate.com/github/imageaid/rails_service_generator.png)](https://codeclimate.com/github/imageaid/rails_service_generator) 
[![Test Coverage](https://codeclimate.com/github/imageaid/rails_service_generator/coverage.png)](https://codeclimate.com/github/imageaid/rails_service_generator)
[![Gem Version](https://badge.fury.io/rb/rails_services.svg)](http://badge.fury.io/rb/rails_services)  

A very (VERY) simple gem for Rails that adds a generator for easily creating a service class and its accompanying spec or test unit file.

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

    $ rails generate rails_services:create Service Model|Controller Sub-folder [opt] --instance [yes (default), no]
    
    $ rails generate rails_services:destroy Service Model|Controller Sub-folder [opt] --instance [yes (default), no]
    
### Sub-folders
Sub-folders are optional but, at this time, you may only use one sub-folder. I generally use the sub-folders when I have a naturally grouped set of services.

### Instance Argument
The instance argument was added in version 2.0.0. It is also optional but does default to `yes` if omitted. In previous iterations of this gem
as well as in my early use of service layers, I did not instantiate my service classes; rather, I created adn accessed them at the class level,
calling class methods (i.e., those defined with `self.`).

I was never satisfied with this and, sometime in the last few months, I read a now-lost blog post on utilizing a `BaseService` class and
instantiating your actual service. I prefer this new approach, for lack of a better word, and have decided to add it to this gem, as the
default style used going forward (starting with 2.0.0).

## Upgrading
The primary change in version 2 is that old services, those that do not include the `BaseService` class, called
and accessed methods that were all defined with `self.`. You do not have to choose one style over another; in fact,
you can mix and match the styles, if you wish.

**Converting Old Service Classes** - Should you want to update your older/previously built services with this approach, you only need to do
the following:

     # include the base service in your class
     class ClassName
       include BaseService

     # Then ... add an initialize method and change the method signatures, simply removing from the definition     
     def call
       # ...
     end
     # becomes
     def call
       # ...
     end
     # and so on for other, similarly defined methods

## Result

Two files are created (spec or test based on your `test_framework`):

+ app/services/model|controller/[sub-folder]/thing.rb
+ spec/services/model|controller/[sub-folder]/thing_spec.rb
+ test/services/model|controller/[sub-folder]/thing_test.rb

## Contributing

1. Fork it ( https://github.com/imageaid/rails_services/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
