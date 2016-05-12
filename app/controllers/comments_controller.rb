class CommentsController < ApplicationController
  before_action :set_post

  def index
  end

  def show
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params.require(:comment).permit!)
    @comment.user= current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Thanks for commenting on my post!' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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
