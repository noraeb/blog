class PostsController < ApplicationController
  before_action :authorize, except: [:show, :index]

  def authorize
    if current_admin.nil?
      redirect_to new_admin_session_url, alert: "Not authorized! Please log in."
    end
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.admin = current_admin

    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.admin = current_admin
    @post.destroy

    if @post.destroy
      redirect_to posts_path, notice: "Post deleted"
    else
      redirect_to new_admin_session_path, alert: "You're not allowed to delete this post"
    end
  end

  private


    def post_params
      params.require(:post).permit(:title, :content, :id)
    end
end
