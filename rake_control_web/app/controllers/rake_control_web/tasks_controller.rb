module RakeControlWeb
  class TasksController < ApplicationController
    def index
      @tasks = RakeControl::Storage.run.summary
    end

    def run
      Rails.application.load_tasks
      Rake::Task[params[:id]].invoke
    ensure
      redirect_to params[:back]
    end
  end
end
