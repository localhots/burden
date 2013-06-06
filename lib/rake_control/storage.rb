module RakeControl
  module Storage
    def run
      case RakeControl.config.storage
      when :active_record, :activerecord
        require 'rake_control/storage/active_record/run'
        RakeControl::Storage::ActiveRecord::Run
      when :mongoid
        require 'rake_control/storage/mongoid/run'
        RakeControl::Storage::Mongoid::Run
      when :mongo_mapper, :mongomapper
        require 'rake_control/storage/mongo_mapper/run'
        RakeControl::Storage::MongoMapper::Run
      else
        raise Exception.new("Unknown storage: #{storage}")
      end
    end

    extend self
  end
end
