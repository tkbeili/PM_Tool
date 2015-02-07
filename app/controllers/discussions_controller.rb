class DiscussionsController < ApplicationController

  def create
    @project = Project.find params[:project_id]
    @discussion = Discussion.new params.require(:discussion).permit(:title, :description)
    @discussion.project_id = params[:project_id]
    @discussion.user = current_user
    respond_to do |format|
      if @discussion.save
        format.html {redirect_to project_path(@project), notice: "Discussion Created"}
        format.js {render}
      else
        format.html {project_path(@project)}
        format.js {render}
        # render text: params
      end
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
    @discussion = Discussion.find params[:id]
    if @discussion.update params.require(:discussion).permit(:title, :description)
      redirect_to project_path(@discussion.project_id)
    else
      render :edit
    end
    # render text: params
  end

  def destroy
    @discussion = Discussion.find params[:id]
    if @discussion.user == current_user && @discussion.destroy
      redirect_to project_path(@discussion.project_id), notice: "Discussion Deleted"
    else
      flash[:error] = "You cannot delete a discussion that is not yours."
      redirect_to project_path(@discussion.project_id)
    end 
  end

end
