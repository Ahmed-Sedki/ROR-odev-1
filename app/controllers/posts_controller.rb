class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :tags]

  def index
    @posts = Post.includes(:user, :category, :tags).all
    @posts = @posts.where(user_id: params[:user_id]) if params[:user_id].present?
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    @posts = @posts.joins(:tags).where(tags: { name: params[:tag] }) if params[:tag].present?
    @posts = @posts.distinct.page(params[:page]).per(per_page)

    render_collection(@posts, serializer: PostSerializer)
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: { error: { message: "Validation failed", details: @post.errors.messages } }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: { error: { message: "Validation failed", details: @post.errors.messages } }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  def tags
    render json: @post.tags
  end

  private

  def set_post
    @post = Post.includes(:user, :category, :tags).find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :category_id)
  end
end

