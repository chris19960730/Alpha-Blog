class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.author_name = current_user.username
    @comment.article_id = params[:id]

    if @comment.save
      flash[:notice] = "Comment was created successfully."
      redirect_to article_path(@comment.article_id)
    else
      render "new"
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
