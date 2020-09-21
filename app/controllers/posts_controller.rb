class PostsController < ApplicationController
  def show
    @post = Post.sluggable.find(params[:id])
  end

  def index
    @posts = Post.order(date: :desc)
  end
end
