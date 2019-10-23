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

  def encrypt1
    render html: "tBc2N67HZ66xVhKf4LBabXkwHiCX3XR78YXsM2grPVc.apAwhPX7rZpFf6lZJkT2c4AmgC7lyAWv3GRvqgb3luM"
  end

  def encrypt2
    render html: "E9i4kw3XP43Y2CQKiP_bvKFO_xjHdBKLb9dMz2Tk9gA.apAwhPX7rZpFf6lZJkT2c4AmgC7lyAWv3GRvqgb3luM"
  end

  def encrypt3
    render html: "ZEHgr2pKwlhRtFqILnwlPGrHgs8jTOayLbEOkyztF0I.apAwhPX7rZpFf6lZJkT2c4AmgC7lyAWv3GRvqgb3luM"
  end
end
