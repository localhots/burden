module Rake
  class Task
    alias :original_execute :execute

    def execute(args)
      RakeControl.wrap(name, comment) do
        original_execute(args)
      end
    end
  end
end
