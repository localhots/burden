module RakeControl
  module Storage
    module ActiveRecord
      class Run < ::ActiveRecord::Base
        self.table_name = 'rake_control_runs'
        attr_accessible :name, :success, :execution_time

        scope :summary, ->{ group(:name).order('created_at desc') }
      end
    end
  end
end
