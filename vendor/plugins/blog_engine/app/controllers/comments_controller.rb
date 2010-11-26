class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      redirect_to post_path(@comment.post_id),
                    :notice => "Comment Created"
    else
      render "new"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post_id), :notice => "Comment Deleted"
  end
end
