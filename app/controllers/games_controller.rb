class GamesController < ApplicationController
  def show
    @game = Game.sluggable.find(params[:id])
  end

  def index
    @games = Game.order(date: :desc)
  end
end
