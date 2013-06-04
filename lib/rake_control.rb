require 'rake'

require 'rake_control/version'
require 'rake_control/wrapper'
require File.expand_path('../rake/task', __FILE__)

module RakeControl
  def wrap(name, description, &block)
    Wrapper.new(name, description, block).execute
  end

  extend self
end
