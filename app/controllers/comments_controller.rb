class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[job_id]
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to job_path(@comment.job)
    else
      flash[:error] = "Comment not saved. Try again."
      redirect_to job_path(@comment.job)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
