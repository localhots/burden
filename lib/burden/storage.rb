module Burden
  module Storage
    def run
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

    extend self
  end
end
