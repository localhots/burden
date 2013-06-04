module RakeControl
  class Config
    attr_accessor :storage

    def initialize
      @storage = :active_record
    end

    def apply
      setup_storage_model
    end

  private

    def setup_storage_model
      case storage
      when :active_record, :activerecord
        require 'rake_control/storage/active_record/rake_control_run'
      when :mongoid
        require 'rake_control/storage/mongoid/rake_control_run'
      when :mongo_mapper, :mongomapper
        require 'rake_control/storage/mongo_mapper/rake_control_run'
      else
        raise Exception.new("Unknown storage: #{storage}")
      end
    end
  end
end
