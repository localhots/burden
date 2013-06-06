# Burden

Burden is a task management tool for Rake. It records all tasks invocations.

Burden Web is a web interface for Burden.

## Installation

Add this lines to your application's Gemfile:
```ruby
gem 'burden'
gem 'burden_web'
```

And then execute:
```
$ bundle
```

## Configuration

For non-Rails apps, add these lines to the top of your application's Rakefile.

For Rails apps, create an initializer containing these lines.

```ruby
require 'burden'

Burden.configure do |c|
  c.storage = :active_record # or :mongoid, :mongo_mapper
  c.ignored_tasks = [/^db:/, /environment/]
  c.on_failure = ->(task_name, execution_time){
    Mail.new(to: me,
      subject: "Task #{task_name} failed!",
      body: "Current time: #{Time.now}\nExecution time: #{execution_time}s"
    ).send
  }
end
```

All configuration options are optional.

## Usage

```ruby
Burden::Storage.run.where(name: 'db:migrate', success: false).order('created_at desc').limit(10)
```

See Burden Web instructions to set up its interface.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
