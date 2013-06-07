module Burden
  module Storage
    module MongoMapper
      class Run
        include ::MongoMapper::Document

        set_collection_name 'burden_runs'
        key :name, String
        key :success, Boolean
        key :execution_time, Float

        scope :summary, ->{ sort(:created_at.desc).group_by(&:name) }
      end
    end
  end
end
