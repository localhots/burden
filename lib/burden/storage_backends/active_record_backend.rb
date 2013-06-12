require 'active_record'
require 'burden/storage_backends/active_record/run'

module Burden
  module StorageBackends
    class ActiveRecordBackend
      attr_reader :connection_success

      def initialize(config)
        @connection_success = true
        begin
          ActiveRecord::Base.establish_connection(config)
        rescue => e
          @connection_success = false
        end
      end

      def ready?
        @connection_success
      end

      def runs
        Burden::StorageBackends::ActiveRecord::Run
      end
    end
  end
end
