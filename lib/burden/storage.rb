module Burden
  module Storage
    module Helper
      def storage
        @storage ||= begin
          case Burden.config.storage
          when :active_record, :activerecord
            require 'burden/storage_backends/active_record_backend'
            Burden::StorageBackends::ActiveRecordBackend.new(Burden.config.storage_config)
          when :mongoid
            require 'burden/storage_backends/mongoid_backend'
            Burden::StorageBackends::MongoidBackend.new(Burden.config.storage_config)
          when :mongo_mapper, :mongomapper
            require 'burden/storage_backends/mongo_mapper_backend'
            Burden::StorageBackends::MongoMapperBackend.new(Burden.config.storage_config)
          else
            raise Exception.new("Unknown storage: #{storage}")
          end
        end
      end
    end
  end
end
