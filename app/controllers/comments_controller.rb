class CommentsController < ApplicationController

  def create
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.new params.require(:comment).permit(:body)
    @comment.discussion_id = @discussion.id
    
    if @comment.save
      # redirect_to :back
      redirect_to project_discussion_path(@discussion.project, @discussion)
    else
      flash[:error] = "Could not save..."
      redirect_to project_discussion_path(@discussion.project, @discussion)
    end
    # redirect_to :back
    # render text: params
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
