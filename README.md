# RailsServices

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rails_services'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_services

## Usage

Description: 

+ Generates a service class and accompanying spec file

Example: 

    $ rails generate rails_services:service Service Model|Controller Sub-folder [opt]

This will create:

+ app/services/model|controller/[sub-folder]/thing.rb
+ spec/services/model|controller/[sub-folder]/thing_spec.rb

## Contributing

1. Fork it ( https://github.com/imageaid/rails_services/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
