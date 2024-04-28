class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @post = current_user&.posts&.new
    @posts = Post.order(created_at: :desc)
    @query = params[:q]

    if @query
      @posts = @posts.where("content ilike ?", "%#{@query}%")
    end

    if params[:username]
      @posts = @posts.joins(:user).where(user: { username: params[:username] })
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      @posts = Post.order(created_at: :desc)
      render 'index', status: :unprocessable_entity
    end
  end

  def post_params
    params.require(:post).permit(:content, :original_post_id)
  end
end
