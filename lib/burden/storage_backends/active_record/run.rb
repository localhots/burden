module Burden
  module StorageBackends
    module ActiveRecord
      class Run < ::ActiveRecord::Base
        self.table_name = 'burden_runs'
        attr_accessible :name, :success, :execution_time, :timestamp

        scope :summary, ->{ order('timestamp desc').group(:name) }
        scope :history, ->(task_name){ where(name: task_name).order('timestamp desc').limit(100) }
      end
    end
  end
end
