class TasksController < ApplicationController

  def create
    @task = Task.new params.require(:answer).permit(:body)
    @task.project_id = params[:project_id]
    @task.save
    render text: params
  end

end
