module Rake
  class Task
    alias_method :original_execute, :execute

    def execute(args)
      Burden.wrap(name){ original_execute(args) }
    end
  end
end
