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

    $ rails generate rails_services:create Service Model|Controller Sub-folder [opt]
    
    $ rails generate rails_services:destroy Service Model|Controller Sub-folder [opt]
    
Sub-folders are optional but, at this time, you may only use one sub-folder. I generally use the sub-folders when I have a naturally grouped set of services.     

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
