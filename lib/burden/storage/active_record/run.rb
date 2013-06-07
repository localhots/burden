module Burden
  module Storage
    module ActiveRecord
      class Run < ::ActiveRecord::Base
        self.table_name = 'burden_runs'
        attr_accessible :name, :success, :execution_time

        scope :summary, ->{ order('created_at desc').group(:name) }
      end
    end
  end
end
