class ProjectsController < ApplicationController
  before_action :authenticate_user!

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
    @project.user = current_user
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
    # @discussion = Discussion.new(project: @project)
    # same as above it removes the empty entry at the end
    @discussion = Discussion.new #(project_id: @project.id)
    @task = Task.new due_date: (Date.today + 1.day)
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
    if @project.user == current_user && @project.destroy
      redirect_to projects_path, notice: "Project Deleted"
    else
      redirect_to projects_path, flash: {error: "You cannot delete a project that is not yours."}
    end
  end


end
