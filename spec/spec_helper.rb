require 'rake_control'

RSpec.configure do |config|
  config.formatter = :progress
  config.color_enabled = true
  config.tty = true
end
