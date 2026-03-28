class PostsController < ApplicationController
  # The use of ':authenticate_user!' cuz it comes by default with devise gem
  before_action :authenticate_user!, only: [:new, :create]

  def index
   # @posts = Post.all
  end
  
  def new 
    @post = Post.new
  end

  def create 
    # devise gem gives us 'current_user' so we can use it here
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else 
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
