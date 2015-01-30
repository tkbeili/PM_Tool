class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new due_date: (Date.today + 1.day)
  end

  def create
    @project = Project.find params[:project_id]
    @task = Task.new params.require(:task).permit(:title, :details, :due_date)
    @task.project_id = params[:project_id]
    if @task.save
      redirect_to project_path(@project.id), notice: "Saved"
    else
      redirect_to project_path(@project.id), notice: "Task not saved"
      # render :new
    end
    # render text: params
  end

  def edit
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
  end

  def update
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    
    
    if @task.update params.require(:task).permit(:title, :details, :due_date)
      redirect_to project_path(@project), notice: "Task Updated"
    else
      redirect_to project_path(@project), notice: "Task Deleted"
    end

  end

  def destroy
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    @task.destroy
    redirect_to project_path(@project)
  end
end
