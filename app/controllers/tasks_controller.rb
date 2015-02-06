class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new due_date: (Date.today + 1.day)
  end

  def create
    @project = Project.find params[:project_id]
    @task = Task.new params.require(:task).permit(:title, :details, :due_date, :status)
    @task.user = current_user
    @task.project_id = params[:project_id]
    if @task.save
      redirect_to project_path(@project.id), notice: "Saved"
    else
      flash[:error] = "Task Not Updated. Title must be present and unique"
      redirect_to project_path(@project.id)
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

    if @task.update params.require(:task).permit(:title, :details, :due_date, :status)
      if (@task.status == true) && (@task.user != current_user)
        TaskMailer.notify_task_owner(@task).deliver_later
      end
      redirect_to project_path(@project), notice: "Task Updated"
    else
      flash[:error] = "Task Not Updated. Title must be present and unique"
      redirect_to project_path(@project)
    end

  end

  def destroy
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]

    if @task.user == current_user && @task.destroy
      redirect_to project_path(@project), notice: "Task Deleted"
    else
      flash[:error] = "You cannot delete a task you did not create"
      redirect_to project_path(@project)
    end
  end
end
