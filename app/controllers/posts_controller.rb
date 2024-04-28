class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @post = current_user&.posts&.new
    set_posts
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
      set_posts
      render "index", status: :unprocessable_entity
    end
  end

  private

  def set_posts
    @posts = Post.includes(:user, original_post: :user).order(created_at: :desc)
  end

  def post_params
    params.require(:post).permit(:content, :original_post_id)
  end
end
