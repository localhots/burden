module RakeControl
  class Wrapper
    attr_reader :name, :description, :block, :success, :exception, :execution_time

    def initialize(name, description, block)
      @name = name
      @description = description
      @block = block
      @success = true
    end

    def execute
      result = measure_time do
        intercept_exceptions do
          block.call
        end
      end
      save_statistics

      success ? result : raise(exception)
    end

  private

    def measure_time
      t = Time.now
      result = yield
      @execution_time = Time.now.to_f - t.to_f
      result
    end

    def intercept_exceptions
      begin
        yield
      rescue => e
        @success = false
        @exception = e
        nil
      end
    end

    def save_statistics
      Run.create(name: name, success: success, execution_time: execution_time) if defined?(Run)
      puts "Task #{name} #{success ? 'finished successfully' : 'failed'}"
      puts "Execution time: #{execution_time.round(4)}"
    end
  end
end
