class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
<<<<<<< HEAD
    @post.admin = current_user_admin
=======
>>>>>>> 3f2b8f553aaa573a2645144d6de1ec6ec99f227a

    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
