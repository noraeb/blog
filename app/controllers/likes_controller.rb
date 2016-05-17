class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.post = @post
    @like.user = current_user


    if @like.save
      respond_to do |format|
        format.html { redirect_to @post, notice: "Thanks for your like!" }
        format.json { render json: { likes: @post.likes.count } }
      end
    else
      redirect_to @post, alert: "Could not like, please retry"
    end
  end

  def destroy
    @like = @post.likes.where(user: current_user).find(params[:id])

    respond_to do |format|
      format.html { redirect_to @post, notice: "You are no longer liking this post"}
      format.json { render json: { errors: @like.errors }, status: :unprocessable_entity }
    end
  end

end
