module BurdenWeb
  class TasksController < ApplicationController
    def index
      @tasks = Burden::Storage.run.summary
      (tasks.map(&:name) - @tasks.map(&:name)).each do |nr_task| # Never runned tasks
        @tasks << Burden::Storage.run.new(
          name: nr_task
        )
      end
    end

    def run
      Rails.application.load_tasks
      Rake::Task[params[:id]].invoke
    ensure
      redirect_to params[:back]
    end
  end
end
