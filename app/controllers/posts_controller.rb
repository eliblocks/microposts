class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.order(created_at: :desc)
  end

  def create
    @post = current_user.posts.new(content: params[:post][:content])

    if @post.save
      redirect_to posts_path
    else
      @posts = Post.all
      render 'index'
    end
  end
end
