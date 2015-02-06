class CommentsController < ApplicationController

  def create
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.new params.require(:comment).permit(:body)
    @comment.user = current_user
    @comment.discussion_id = @discussion.id
    
    
    if (@comment.save) && (@discussion.user == current_user)
      redirect_to project_discussion_path(@discussion.project, @discussion)
    elsif @comment.save
      DiscussionMailer.notify_discussion_owner(@comment).deliver_now
      redirect_to project_discussion_path(@discussion.project, @discussion)
      # redirect_to :back
    else
      flash[:error] = "Body cannot be empty"
      redirect_to project_discussion_path(@discussion.project, @discussion)
    end
    # redirect_to :back
    # render text: params
  end

  def edit
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.find params[:id]
    # render text: params
  end

  def update
    @comment = Comment.find params[:id]
    if @comment.update params.require(:comment).permit(:body)
      # byebug
      redirect_to project_discussion_path(@comment.project, @comment.discussion)
    else
      flash[:error] = "Body cannot be empty"
      redirect_to edit_discussion_comment_path(@comment.discussion, @comment)
    end
    # render text: params
  end

  def destroy
    @comment = Comment.find params[:id]
    if @comment.user == current_user && @comment.destroy
      redirect_to project_discussion_path(@comment.project, @comment.discussion)
    else
      flash[:error] = "You cannot delete a comment you did not create"
      redirect_to project_discussion_path(@comment.project, @comment.discussion)
    end
    # render text: params
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
