require 'burden/storage_backends/abstract/run'

module Burden
  module StorageBackends
    class AbstractBackend
      def initialize(config)
      end

      def ready?
        raise NotImplementedError.new('Method #ready? must be overwritten')
      end

      def runs
        raise NotImplementedError.new('Method #runs must be overwritten')
      end
    end
  end
end
