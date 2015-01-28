class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new due_date: (Date.today + 1.day)
  end

  def create
    @task = Task.new params.require(:task).permit(:title, :details, :due_date)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
    # render text: params
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to tasks_path
  end
end
