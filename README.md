# Burden

Burden is a tool for managing Rake tasks.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'burden'
```

And then execute:
```
$ bundle
```

## Configuration

Add this lines to the top of your application's Rakefile:
```ruby
require 'burden'
Burden.configure do |c|
  c.storage = :active_record # or :mongoid, :mongo_mapper
end
```

## Usage

stats = Rake::Task['my:task:name'].stats
stats.log

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
