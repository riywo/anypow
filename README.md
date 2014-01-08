# Anypow

[![Build Status](https://travis-ci.org/riywo/anypow.png?branch=master)](https://travis-ci.org/riywo/anypow)

Simpe rack proxy to use Pow in any language.

## Installation

Add this line to your application's Gemfile:

    gem 'anypow'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install anypow

## Usage

    $ cat config.ru
    require "anypow"
    extend Anypow
    run_pow "plackup -p $PORT"

You can also use [foreman](https://github.com/ddollar/foreman) with pow!

    $ cat config.ru
    require "anypow"
    extend Anypow
    run_pow "foreman start -p $PORT"
    require ::File.expand_path('../config/environment',  __FILE__)
    run Rails.application
    
    $ cat Procfile
    web: rackup -p $PORT
    worker: rake worker:start

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/riywo/anypow/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

