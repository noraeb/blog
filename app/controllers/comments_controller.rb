class CommentsController < ApplicationController
  before_action :set_post
  def index
  end

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to root_url, notice: 'Post was successfully created.'
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

end
