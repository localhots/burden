module BurdenWeb
  class TasksController < ApplicationController
    def index
      @tasks = Burden::Storage.run.summary
      (tasks.map(&:name) - @tasks.map(&:name)).each do |nr_task| # Never runned tasks
        next if ignore? nr_task
        @tasks << Burden::Storage.run.new(
          name: nr_task
        )
      end
    end

    def ignore? name
      Burden.config.ignored_tasks.collect{ |r| (name =~ r) ? 1 : 0 }.map(&:to_i).inject(:+) != 0
    end

    def run
      Rails.application.load_tasks
      task = Rake::Task[params[:id]]

      task.prerequisite_tasks.each{ |t| t.execute(nil) }
      task.execute(nil)
    rescue => e # Gotta catch 'em all!
    ensure
      redirect_to params[:back]
    end
  end
end
