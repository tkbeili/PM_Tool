class DiscussionsController < ApplicationController

  def create
    @project = Project.find params[:project_id]
    @discussion = Discussion.new params.require(:discussion).permit(:title, :description)
    @discussion.project_id = params[:project_id]
    if @discussion.save
      redirect_to project_path(@project)
    else
      render "projects/show"
      # render text: params
    end
  end

  def show
    @discussion = Discussion.find params[:id]
    @project = Project.find params[:project_id]
  end

  def edit
    @discussion = Discussion.find params[:id]
    @project = Project.find params[:project_id]
  end

  def update
    @discussion.update params.require(:discussion).permit(:title, :description)
    redirect_to @discussion
  end

  def destroy
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to project_path(@discussion.project_id)
  end

end
