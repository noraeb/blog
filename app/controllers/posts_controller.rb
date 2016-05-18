class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    if @post.destroy
      redirect_to posts_path, notice: 'Post successfully deleted'
    else
      redirect_to new_user_session, alert: "Not authorized! Please log in."
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_url, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
     @post = Post.find( params[:id] )
  end

  def update
    respond_to do |format|
      @post = Post.find( params[:id] )

      if @post.update_attributes( post_params )
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @tipi.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :id, :image)
    end
end
