class TinyTownsRandomizerController < ApplicationController

  BASE_GAME_BUILDINGS = {
    "blue" =>   [ "Cottage" ],
    "red" =>    [ "Farm", "Greenhouse", "Orchard", "Granary" ],
    "orange" => [ "Cloister", "Abbey", "Temple", "Chapel" ],
    "yellow" => [ "Tailor", "Theater", "Bakery", "Merchant" ],
    "gray" =>   [ "Millstone", "Shed", "Well", "Fountain" ],
    "black" =>  [ "Factory", "Trading Post", "Bank", "Warehouse" ],
    "green" =>  [ "Inn", "Almshouse", "Feast Hall", "Tavern" ],
    "purple" => [ "Obelisk of the Crescent", "Cathedral of Caterina", "Opaleye's Watch",
      "Archive of the Second Age", "The Starloom", "The Sky Baths", "Architect's Guild",
      "Grand Mausoleum of the Rodina", "Silva Forum", "Shrine of the Elder Tree",
      "Barrett Castle", "Grove University", "Statue of the Bondmaker", "Fort Ironweed" ]
  }

  FORTUNE_BUILDINGS = {
    blue:   [ ],
    red:    [ "Root Cellar", "Tithe Barn" ],
    orange: [ "Cathedral", "Parsonage" ],
    yellow: [ "Jewler", "Teahouse" ],
    gray:   [ "Statue" ],
    black:  [ "Museum", "Oddity Shop" ],
    green:  [ "Gambler's Den", "Schoolhouse" ],
    purple: [ "Caterina's Grotto", "Eraflage Vineyard", "Estival Festival", "Hollow Hill",
      "Mason's Guild", "The Petal Promenade", "The Prism Forge", "Southern Semaphore" ]
  }

  def index
    randomizer
    render 'randomizers/tiny_towns/index'
  end

  def randomize_all_buildings
    set_all_buildings_to_random
    write_to_cookie
    redirect_to '/randomizers/tiny_towns'
  end

  def randomize_building
    set_building_to_random(params[:color])
    write_to_cookie
    redirect_to '/randomizers/tiny_towns'
  end

  private

  def write_to_cookie
    cookies.permanent[:tiny_towns_randomizer] = JSON.generate randomizer
  end

  def randomizer
    @randomizer ||= cookies[:tiny_towns_randomizer].nil? ? default_randomizer_setup : read_from_cookie
  end

  def default_randomizer_setup
    { "buildings" => BASE_GAME_BUILDINGS }
  end

  def read_from_cookie
    JSON.parse cookies[:tiny_towns_randomizer]
  end

  def set_all_buildings_to_random
    randomizer["buildings"].each { |key, value| set_building_to_random(key) }
  end

  def set_building_to_random(color)
    randomizer["buildings"][color].shuffle!
  end
end
