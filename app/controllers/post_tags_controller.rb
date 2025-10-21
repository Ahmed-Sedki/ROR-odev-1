class PostTagsController < ApplicationController
  before_action :set_post_tag, only: [:destroy]

  def create
    @post_tag = PostTag.new(post_tag_params)
    if @post_tag.save
      render json: @post_tag, status: :created
    else
      render json: { error: { message: "Validation failed", details: @post_tag.errors.messages } }, status: :unprocessable_entity
    end
  end

  def destroy
    @post_tag.destroy
    head :no_content
  end

  private

  def set_post_tag
    @post_tag = PostTag.find(params[:id])
  end

  def post_tag_params
    params.require(:post_tag).permit(:post_id, :tag_id)
  end
end

