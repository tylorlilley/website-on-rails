class RandomizersController < ApplicationController
  def tiny_towns
    render 'randomizers/tiny_towns/index'
  end

  def talisman
    render 'randomizers/talisman/index'
  end
end
