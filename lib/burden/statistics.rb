module Burden
  class Statistics
    attr_reader :name, :success, :execution_time, :timestamp

    def initialize(params)
      @name = params[:name]
      @success = params[:success]
      @execution_time = params[:execution_time]
      @timestamp = params[:timestamp]
    end

    def save
      if defined?(Rails) && Rails.respond_to?(:application) && Rails.application.present?
        # FIXME: Dirty stuff
        conf = Rails.configuration.database_configuration[Rails.env]
        ActiveRecord::Base.establish_connection(conf)

        begin
          Burden.runs.create(name: name, success: success, execution_time: execution_time, timestamp: timestamp)
        rescue
          log_to_stdout(:failed)
        end
      else
        log_to_stdout(:no_rails)
      end
    end

    def log_to_stdout(reason = :no_rails)
      puts
      puts "------------------------------------------------------------"
      case reason
      when :no_rails
        puts "Rails environment is not loaded. Sending output to STDOUT"
      when :failed
        puts "Failed to persist this run. Sending output to STDOUT"
      end
      puts "Task #{name} #{success ? 'finished successfully' : 'failed'}"
      puts "Execution time: #{execution_time.round(4)}"
    end
  end
end
