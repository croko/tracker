module Api
  class TasksController < ApplicationController
    respond_to :json

    def index
      @tasks = Task.all
      fresh_when(etag: @tasks, last_modified: @tasks.maximum(:updated_at))
    end

    def show
      @task = Task.find(params[:id])
      if @task
        fresh_when(etag: @task, last_modified: @task.updated_at)
      end
    rescue
      render json: {id: 'not_found', message: 'Not Found'}, status: 404
    end
  end
end
