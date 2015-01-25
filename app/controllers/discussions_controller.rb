class DiscussionsController < ApplicationController

  def create
    @discussion = Discussion.new params.require(:discussion).permit(:title, :description)
    @discussion.project_id = params[:project_id]
    @discussion.save
    render text: params
  end

end
