class CommentsController < ApplicationController
  before_action :set_post
  before_action :find_comment, only: [:edit, :update, :destroy]
  def create
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end
end