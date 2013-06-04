module RakeControl
  class Run
    include MongoMapper::Document

    key :name, String
    key :success, Boolean
    key :execution_time, Float
  end
end
