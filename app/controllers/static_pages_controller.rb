class StaticPagesController < ApplicationController
  def home
    @post = Post.order(date: :desc).first
  end

  def help
  end

  def about
  end

  def contact
  end

  def follow
  end
end
