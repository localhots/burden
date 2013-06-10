module BurdenWeb
  class RunsController < ApplicationController
    def index
      @runs = Burden.runs.history(params[:task_id])
    end
  end
end
