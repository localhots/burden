module BurdenWeb
  class RunsController < ApplicationController
    def index
      @runs = Burden::Storage.run.where(name: params[:task_id]).order('created_at desc').limit(100)
    end
  end
end
