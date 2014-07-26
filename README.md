# RailsServices

A very (VERY) simple gem for Rails that adds a generator for easily creating a service class and its accompanying spec file.

At this time, the gem only creates an RSpec test file. MiniTest and Test::Unit support forthcoming. 

## Requirements 

Rails 3.2.19 and higher

## Installation

Add this line to your application's Gemfile:

    gem 'rails_services'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_services

## Usage

Example: 

    $ rails generate rails_services:service Service Model|Controller Sub-folder [opt]
    
Sub-folders are optional but, at this time, you may only use one sub-folder. I generally use the sub-folders when I have a naturally grouped set of services.     

## Result

Two files are created:

+ app/services/model|controller/[sub-folder]/thing.rb
+ spec/services/model|controller/[sub-folder]/thing_spec.rb

## Contributing

1. Fork it ( https://github.com/imageaid/rails_services/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
