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

end
