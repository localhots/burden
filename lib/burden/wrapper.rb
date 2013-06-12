module Burden
  class Wrapper
    attr_reader :name, :block, :success, :exception, :execution_time, :timestamp

    def initialize(name, block)
      @name = name
      @block = block
      @success = true
      @timestamp = Time.now.utc
    end

    def execute
      return block.call if ignored?

      result = measure_time do
        intercept_exceptions do
          block.call
        end
      end

      begin
        save_statistics
      rescue => e
      end

      unless success
        Burden.config.trigger_failure_callback(name, execution_time, timestamp)
        raise(exception)
      end

      Burden.config.trigger_success_callback(name, execution_time, timestamp)
      result
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

    def ignored?
      Burden.config.ignored_tasks.collect{ |r| (name =~ r) ? 1 : 0 }.map(&:to_i).inject(:+) != 0
    end

    def save_statistics
      Statistics.new(name: name, success: success, execution_time: execution_time, timestamp: timestamp).save
    end

    module Helper
      def wrap(name, &block)
        Wrapper.new(name, block).execute
      end
    end
  end
end
