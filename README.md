# DistributedMutex

[![Build Status](https://travis-ci.org/unchartedcode/distributed-mutex.svg?branch=master)](https://travis-ci.org/unchartedcode/distributed-mutex)
[![Coverage Status](https://coveralls.io/repos/github/unchartedcode/distributed-mutex/badge.svg?branch=master)](https://coveralls.io/github/unchartedcode/distributed-mutex?branch=master)

This gem allows you to lock specific chunks of code based on a shared key. It's a Mutex, but locks beyond a single machine by utilizing [Redis](http://redis.io/)'s [SETNX](http://redis.io/commands/setnx). This code was originally extracted from Discourse into Uncharted Scheduler and later extracted from there into it's own repository.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'distributed-mutex'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install distributed-mutex

## Usage

You simply need to wrap your code in a block and give it a key.

```ruby
require 'distributed-mutex'

DistributedMutex.new("custom-key").syncronize do
  puts "Custom Code"
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/uncharted-code/distributed-mutex.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
