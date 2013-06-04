module RakeControl
  class Run < ActiveRecord::Base
    attr_accessible :name, :success, :execution_time
  end
end
