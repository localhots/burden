# Burden

Burden is a task management tool for Rake. It records all tasks invocations.

Burden Web is a web interface for Burden.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'burden'
```

And then execute:
```
$ bundle
$ bundle exec rails generate burden:install
```

## Configuration

For non-Rails apps, add these lines to the top of your application's Rakefile.

For Rails apps, create an initializer containing these lines.

```ruby
require 'burden'

Burden.configure do |c|
  c.storage = :active_record # or :mongoid, :mongo_mapper
  c.ignored_tasks = [/^db:/, /environment/]
  c.on_failure = ->(task_name, execution_time, timestamp){
    Mail.new(to: me,
      subject: "Task #{task_name} failed!",
      body: <<-MSG
        Started at: #{timestamp}
        Execution time: #{execution_time}s
        Status: FAILED
      MSG
    ).send
  }
end
```

All configuration options are optional.

## Usage

```ruby
Burden::Storage.run.where(name: 'db:migrate', success: false).order('created_at desc').limit(10)
```

## Dashboard
![Burden Dashboard](http://f.cl.ly/items/0Q0N0E1N2y3P1R2b3M2x/burden_dash.png)

Burden comes with a nice dashboard to view and manage your tasks right from the web.

To install it add this line to your application's Gemfile:
```ruby
gem 'burden_web'
```

Mount Burden's web interface to the path of your choise in `config/routes.rb`:
```ruby
Rails.application.routes.draw do
  mount BurdenWeb::Engine => '/burden'
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
