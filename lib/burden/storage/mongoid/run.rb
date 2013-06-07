module Burden
  module Storage
    module Mongoid
      class Run
        include ::Mongoid::Document

        store_in collection: 'burden_runs'
        field :name, type: String
        field :success, type: Boolean
        field :execution_time, type: Float

        scope :summary, ->{ sort(created_at: -1).group_by(&:name) }
      end
    end
  end
end
