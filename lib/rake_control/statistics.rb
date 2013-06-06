module RakeControl
  class Statistics
    attr_reader :name, :success, :execution_time

    def initialize(params)
      @name = params[:name]
      @success = params[:success]
      @execution_time = params[:execution_time]
    end

    def save
      if defined?(Rails) && Rails.respond_to?(:application) && Rails.application.present?
        conf = Rails.configuration.database_configuration[Rails.env]
        ActiveRecord::Base.establish_connection(conf)
        Storage.run.create(name: name, success: success, execution_time: execution_time)
      else
        puts
        puts "------------------------------------------------------------"
        puts "Rails environment is not loaded. Sending output to STDOUT"
        puts "Task #{name} #{success ? 'finished successfully' : 'failed'}"
        puts "Execution time: #{execution_time.round(4)}"
      end
    end
  end
end
