module BurdenWeb
  class ApplicationController < ActionController::Base
    def rake_tasks
      @rake_tasks ||= begin
        Rails.application.load_tasks
        Rake.application.tasks.keep_if do |task|
          task.name =~ /^[a-z0-9_:]+$/
        end
      end
    end
  end
end
