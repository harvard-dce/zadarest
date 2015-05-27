# Zadarest [![Build Status](https://secure.travis-ci.org/harvard-dce/zadarest.png?branch=master)](https://travis-ci.org/harvard-dce/zadarest) [![Code Climate](https://codeclimate.com/github/harvard-dce/zadarest/badges/gpa.svg)](https://codeclimate.com/github/harvard-dce/zadarest)

A minimal ruby REST client for the [zadara storage REST
API](http://vpsa-api.zadarastorage.com/).

## Requirements

* A Zadara VPSA and an access token
* Ruby >= 2.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zadarest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zadarest

## Usage

You need to run this within a network that can access your zadara VPSA or set up an SSH tunnel thusly:

    ssh -A -L 8080:<your vpsa API url>:80 <your_proxy_host_that_can_access_zadara.com>

And then, in ruby:

    config = Zadarest::Config.new(api_endpoint: 'http://localhost:8080', access_key: '<your access key>')
    user_client = Zadarest::Users.new(config: config)
    puts user_client.all.inspect # a list of users appears!

    pool_client = Zadarest::Pools.new(config: config)
    puts pool_client.all.inspect # A list of pools appears!

## Todo

* Support the most useful API endpoints

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release` to create a git tag for the version, push git
commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/zadarest/fork )
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Write tests. We use rspec and only documentation fixes will be accepted
   without tests.
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request

## Contributors

* Dan Collis-Puro - [djcp](https://github.com/djcp)

## Copyright

2015 President and Fellows of Harvard College
