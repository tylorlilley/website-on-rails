class StaticPagesController < ApplicationController
  def home
    @post = Post.last
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
