class LikesController < ApplicationController
  load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.user = current_user
    @like.post = @post

    if @like.save
      respond_to do |format|
        format.html { redirect_to @post, notice: "Thanks for your like!" }
        format.json { render json: { likes: @post.likes.count } }
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, alert: "Awwwhh snap! No likes for the likes of you." }
        format.json { render json: { errors: @like.errors }, status: :unprocessable_entity }
      end
    end
  end
end

#   def destroy
#     @like = @post.likes.where(user: current_user).find(params[:id])
#
#     respond_to do |format|
#       format.html { redirect_to @post, notice: "You are no longer liking this post"}
#       format.json { render json: { errors: @like.errors }, status: :unprocessable_entity }
#     end
#   end
#
# end
