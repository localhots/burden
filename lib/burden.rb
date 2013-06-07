require 'bundler/setup'
require 'rake'
require File.expand_path('../rake/task', __FILE__)

require 'burden/config'
require 'burden/statistics'
require 'burden/storage'
require 'burden/version'
require 'burden/wrapper'

# require 'generators/burden/install_generator'

module Burden
  include Config::Helper

  def wrap(name, description, &block)
    Wrapper.new(name, description, block).execute
  end

  extend self
end
