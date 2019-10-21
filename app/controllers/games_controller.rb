class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.order(date: :desc)
  end

  def download
    @game ||= Game.find(params[:id])
    send_file helpers.download_filename_for(@game), type: "application/zip"
  end
end
