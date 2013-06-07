module BurdenWeb
  class RunsController < ApplicationController
    def index
      @runs = Burden::Storage.run.history(params[:task_id])
    end
  end
end
