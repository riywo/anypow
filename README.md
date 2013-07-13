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
    run Anypow::App.new("python -m SimpleHTTPServer $PORT")

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
