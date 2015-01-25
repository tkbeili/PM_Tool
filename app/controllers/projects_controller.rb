class ProjectsController < ApplicationController

  def index
    # @projects = Project.all

    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @projects = Project.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
  end


  def create
    @project = Project.new params.require(:project).permit(:title, :description, :due_date)
    if @project.save
      redirect_to projects_path, notice: "Project Created"
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
    @project = Project.find params[:id]
    @discussion = @project.discussions.new
    # render text: params
  end

  def update
    @project = Project.find params[:id]
    @project.update params.require(:project).permit(:title, :description, :due_date)
    
    if @project.save
      redirect_to projects_path, notice: "Project Updated"
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path, notice: "Project Deleted"
  end
end
