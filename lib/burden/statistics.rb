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
      # FIXME
      # if Burden.storage.ready?
      #   Burden.storage.runs.create(name: name, success: success, execution_time: execution_time, timestamp: timestamp)
      # end

      File.open(Burden.config.log_file, 'a') do |f|
        f.write(log_message)
        f.close
      end
    end

  private

    def log_message
<<-TEXT
Timestamp: #{timestamp}
Task: #{name}
Execution #{success ? 'finished successfully' : 'failed'}
Execution time: #{execution_time.round(4)}

TEXT
    end
  end
end
