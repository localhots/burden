require 'bundler/setup'

require 'rake'
require 'rake/task'
require 'rake_ext/task'

require 'burden/config'
require 'burden/statistics'
require 'burden/storage'
require 'burden/version'
require 'burden/wrapper'

module Burden
  include Config::Helper

  def wrap(name, &block)
    Wrapper.new(name, block).execute
  end

  extend self
end
