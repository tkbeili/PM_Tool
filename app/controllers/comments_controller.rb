class CommentsController < ApplicationController

  def create
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.new params.require(:comment).permit(:body)
    @comment.user = current_user
    @comment.discussion_id = @discussion.id
    
    respond_to do |format|
      if (@comment.save)
        if (@discussion.user != current_user)
          DiscussionMailer.notify_discussion_owner(@comment).deliver_later
        end
        format.html {redirect_to project_discussion_path(@discussion.project, @discussion), notice: "Comment Created!"}
        format.js {render}
        # redirect_to :back
      else
        # flash[:error] = "Body cannot be empty"
        format.html {redirect_to project_discussion_path(@discussion.project, @discussion)}
        format.js {render js: "alert('Body cannot be empty');"}
      end
      # redirect_to :back
      # render text: params
    end
  end

  def edit
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.find params[:id]
    # render text: params
  end

  def update
    @comment = Comment.find params[:id]
    respond_to do |format|
      if @comment.update params.require(:comment).permit(:body)
        format.html {redirect_to project_discussion_path(@comment.project, @comment.discussion)}
        format.js {render}
      else
        # flash[:error] = "Body cannot be empty"
        format.html {redirect_to edit_discussion_comment_path(@comment.discussion, @comment)}
        format.js {render}
      end
    end
    # render text: params
  end

  def destroy
    @comment = Comment.find params[:id]
    respond_to do |format|
      if @comment.user == current_user && @comment.destroy
        format.js {render}
        format.html {redirect_to project_discussion_path(@comment.project, @comment.discussion), notice: "DELETED"}
      else
        format.js {render js: "alert('Durppy Derp');"}
        format.html {redirect_to project_discussion_path(@comment.project, @comment.discussion), notice: "You cannot delete a comment you did not create"}
      end
    end
    # render text: params
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
