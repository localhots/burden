module Burden
  module Storage
    module ActiveRecord
      class Run < ::ActiveRecord::Base
        self.table_name = 'burden_runs'
        attr_accessible :name, :success, :execution_time

        scope :summary, ->{ group(:name).order('created_at desc') }
      end
    end
  end
end
