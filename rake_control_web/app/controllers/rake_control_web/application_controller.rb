module RakeControlWeb
  class ApplicationController < ActionController::Base
    def tasks
      Rake.application.tasks
    end
  end
end
