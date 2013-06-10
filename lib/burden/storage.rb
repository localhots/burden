module Burden
  module Storage
    module Helper
      def runs
        @storage_class ||= begin
          case Burden.config.storage
          when :active_record, :activerecord
            require 'burden/storage/active_record/run'
            Burden::Storage::ActiveRecord::Run
          when :mongoid
            require 'burden/storage/mongoid/run'
            Burden::Storage::Mongoid::Run
          when :mongo_mapper, :mongomapper
            require 'burden/storage/mongo_mapper/run'
            Burden::Storage::MongoMapper::Run
          else
            raise Exception.new("Unknown storage: #{storage}")
          end
        end
      end
    end
  end
end
