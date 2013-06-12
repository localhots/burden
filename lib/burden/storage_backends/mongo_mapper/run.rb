module Burden
  module StorageBackends
    module MongoMapper
      class Run
        include ::MongoMapper::Document

        set_collection_name 'burden_runs'
        key :name, String
        key :success, Boolean
        key :execution_time, Float
        key :timestamp, Time

        scope :summary, ->{ sort(:timestamp.desc).group_by(&:name) }
        scope :history, ->(task_name){ where(name: task_name).sort(:timestamp.desc).group_by(&:name) }
      end
    end
  end
end
