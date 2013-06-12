module Burden
  module StorageBackends
    module Abstract
      class Run
        attr_accessor :name, :success, :execution_time, :timestamp

        def initialize(attributes = {})
          @name = attributes[:name]
          @success = attributes[:success]
          @execution_time = attributes[:execution_time]
          @timestamp = attributes[:timestamp]
        end

        def save
          raise NotImplementedError.new('Method #save must be overwritten')
        end

        def summary
          raise NotImplementedError.new('Method #summary must be overwritten')
        end

        def history(task_name)
          raise NotImplementedError.new('Method #history must be overwritten')
        end
      end
    end
  end
end
