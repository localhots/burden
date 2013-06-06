module RakeControlWeb
  class ApplicationController < ActionController::Base
    def tasks
      Rails.application.load_tasks
      Rake.application.tasks.keep_if do |task|
        task.name =~ /^[a-z0-9_:]+$/
      end
    end
  end
end
