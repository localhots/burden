module RakeControl
  module Storage
    module Mongoid
      class Run
        include ::Mongoid::Document

        field :name, type: String
        field :success, type: Boolean
        field :execution_time, type: Float
      end
    end
  end
end
