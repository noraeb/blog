class CommentsController < ApplicationController
  before_action :set_post
  def index
  end

  def show
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params.require(:comment).permit!)

    if @comment.save
      redirect_to post_path(@post), notice: 'Thanks for commenting on my post!'
    else
      render :new
    end
  end

  def destroy
  end

  private
  def set_post
   @post = Post.find(params[:post_id])
  end

  def comment_params
  params.require(:comment).permit(:text, :user_id, :post)
  end

end
