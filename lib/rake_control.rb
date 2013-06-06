require 'bundler/setup'
require 'rake'
require File.expand_path('../rake/task', __FILE__)

require 'rake_control/config'
require 'rake_control/statistics'
require 'rake_control/storage'
require 'rake_control/version'
require 'rake_control/wrapper'

module RakeControl
  include Config::Helper

  def wrap(name, description, &block)
    Wrapper.new(name, description, block).execute
  end

  extend self
end
