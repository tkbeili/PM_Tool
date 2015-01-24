class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new due_date: (Date.today + 1.day)
  end

  def create
    @task = Task.new params.require(:task).permit(:title, :due_date)
    if @task.save
      redirect_to tasks_path
    else
      render text: params
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
