module Burden
  class Config
    attr_accessor :storage,       # Storage backend (ActiveRecord, Mongoid, MongoMapper)
                  :ignored_tasks, # Do not log this tasks (eg. environment task)
                  :on_success,    # Success callback (expected to be a Proc)
                  :on_failure     # Failure callback (expected to be a Proc)

    def initialize
      @storage = :active_record
      @ignored_tasks = [/environment/]
    end

    def trigger_success_callback(name, execution_time)
      on_success.send(name, execution_time) unless on_success.nil?
    end

    def trigger_failure_callback(name, execution_time)
      on_failure.send(name, execution_time) unless on_failure.nil?
    end

    module Helper
      def config
        @config ||= Config.new
      end

      def configure
        yield config if block_given?
      end
    end
  end
end
