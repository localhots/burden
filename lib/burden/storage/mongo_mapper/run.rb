module Burden
  module Storage
    module MongoMapper
      class Run
        include ::MongoMapper::Document

        set_collection_name 'burden_runs'
        key :name, String
        key :success, Boolean
        key :execution_time, Float
      end
    end
  end
end
