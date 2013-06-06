module RakeControl
  class Config
    attr_accessor :storage,      # Storage backend (ActiveRecord, Mongoid, MongoMapper)
                  :ignored_tasks # Do not log this tasks (eg. environment task)

    def initialize
      @storage = :active_record
      @ignored_tasks = [:environment]
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
