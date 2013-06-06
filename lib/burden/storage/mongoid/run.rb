module Burden
  module Storage
    module Mongoid
      class Run
        include ::Mongoid::Document

        store_in collection: 'burden_runs'
        field :name, type: String
        field :success, type: Boolean
        field :execution_time, type: Float
      end
    end
  end
end
