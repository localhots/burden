module Rake
  class Task
    alias_method :original_execute, :execute

    def execute(args)
      Burden.wrap(name, comment) do
        original_execute(args)
      end
    end
  end
end
