class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new params.require(:project).permit(:title, :description, :due_date)
    if @project.save
      redirect_to
    else
      render :new
    end
    # render text: params
  end

  def new
    @project = Project.new due_date: (Date.today + 7.day)
  end

  def edit
    @project = Project.find params[:id]
  end

  def show
  end

  def update
    @project = Project.find params[:id]
    @project.update params.require(:project).permit(:title, :description, :due_date)
    
    if @project.save
      redirect_to
    else
      render :edit
    end
  end

  def destroy
  end
end
