module RakeControl
  module Storage
    module MongoMapper
      class Run
        include ::MongoMapper::Document

        key :name, String
        key :success, Boolean
        key :execution_time, Float
      end
    end
  end
end
