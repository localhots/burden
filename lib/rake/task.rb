module Rake
  class Task
    alias_method :original_execute, :execute

    def execute(args)
      RakeControl.wrap(name, comment) do
        original_execute(args)
      end
    end
  end
end
