module Burden
  module StorageBackends
    module Mongoid
      class Run
        include ::Mongoid::Document

        store_in collection: 'burden_runs'
        field :name, type: String
        field :success, type: Boolean
        field :execution_time, type: Float
        field :timestamp, type: Time

        scope :summary, ->{ sort(timestamp: -1).group_by(&:name) }
        scope :history, ->(task_name){ where(name: task_name).sort(timestamp: -1).group_by(&:name) }
      end
    end
  end
end
