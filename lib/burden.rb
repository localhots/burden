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
  extend Config::Helper
  extend Storage::Helper
  extend Wrapper::Helper
end
