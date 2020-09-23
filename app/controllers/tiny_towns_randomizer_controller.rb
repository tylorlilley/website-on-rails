class TinyTownsRandomizerController < ApplicationController

  BUILDINGS = {
    "base_game" => {
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
        "Barrett Castle", "Grove University", "Statue of the Bondmaker", "Fort Ironweed",
        "Mandras Palace" ]
    },
    "fortune" => {
      "blue" =>   [ "Cottage" ],
      "red" =>    [ "Root Cellar", "Tithe Barn" ],
      "orange" => [ "Cathedral", "Parsonage" ],
      "yellow" => [ "Jewler", "Teahouse" ],
      "gray" =>   [ "Statue", "Mine" ],
      "black" =>  [ "Museum", "Oddity Shop" ],
      "green" =>  [ "Gambler's Den", "Schoolhouse" ],
      "purple" => [ "Caterina's Grotto", "Eraflage Vineyard", "Estival Festival", "Hollow Hill",
        "Mason's Guild", "The Petal Promenade", "The Prism Forge", "Southern Semaphore", "The Treasury of Okaver", "Shrine of the Windseed" ]
    },
    "villagers" => {
      "blue" =>   [ "Cottage" ],
      "red" =>    [ ],
      "orange" => [ ],
      "yellow" => [ ],
      "gray" =>   [ ],
      "black" =>  [ ],
      "green" =>  [ ],
      "purple" => [ ]
    },
    "dead_reckoning" => {
      "blue" =>   [ ],
      "red" =>    [ ],
      "orange" => [ ],
      "yellow" => [ ],
      "gray" =>   [ ],
      "black" =>  [ ],
      "green" =>  [ "Pirates' Den" ],
      "purple" => [ ]
    },
    "flgs_and_larkstone" => {
      "blue" =>   [ ],
      "red" =>    [ ],
      "orange" => [ ],
      "yellow" => [ "Friendly Local Game Store" ],
      "gray" =>   [ ],
      "black" =>  [ ],
      "green" =>  [ ],
      "purple" => [ "Larkstone" ]
    },
  }

  def index
    randomize_everything if cookies[:tiny_towns_randomizer].nil?
    randomizer
    number_of_players
    render 'randomizers/tiny_towns/index'
  end

  def randomize_all
    randomize_everything
    redirect_to '/randomizers/tiny_towns'
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

  def randomize_all_players
    set_all_players_to_random_buildings
    write_to_cookie
    redirect_to '/randomizers/tiny_towns'
  end

  def randomize_player
    set_player_to_random_buildings(params[:player].to_i)
    write_to_cookie
    redirect_to '/randomizers/tiny_towns'
  end

  def toggle_all_players
    set_all_players_hidden_status
    write_to_cookie
    redirect_to '/randomizers/tiny_towns'
  end

  def toggle_player
    set_player_hidden_status(params[:player])
    write_to_cookie
    redirect_to '/randomizers/tiny_towns'
  end

  def set_player_count
    set_all_players_active_status(params[:number_of_players].to_i)
    write_to_cookie
    redirect_to '/randomizers/tiny_towns'
  end

  def number_of_players
    @number_of_players = randomizer["players"].values.reduce(0) do |total_players, player|
      YAML.load(player["active"]) ? total_players + 1 : total_players
    end
  end

  def toggle_expansion
    set_expansion_active_status(params[:expansion])
    write_to_cookie
    redirect_to '/randomizers/tiny_towns'
  end

  private

  def randomize_everything
    set_all_players_active_status(number_of_players)
    set_all_buildings_to_random
    set_all_players_to_random_buildings
    write_to_cookie
  end

  def write_to_cookie
    cookies.permanent[:tiny_towns_randomizer] = JSON.generate randomizer
  end

  def randomizer
    @randomizer ||= cookies[:tiny_towns_randomizer].nil? ? default_randomizer_setup : read_from_cookie
  end

  def default_randomizer_setup
    {
      "buildings" => BUILDINGS["base_game"],
      "players" =>  {
        "1" => { "active" => "true", "hidden" => "true" },
        "2" => { "active" => "true", "hidden" => "true" },
        "3" => { "active" => "true", "hidden" => "true" },
        "4" => { "active" => "true", "hidden" => "true" },
        "5" => { "active" => "false", "hidden" => "true" },
        "6" => { "active" => "false", "hidden" => "true" },
      },
      "settings" => {
        "hidden_players" => "true",
        "expansions" => {
          "base_game" => "true",
          "fortune" => "false",
          "villagers" => "false",
          "flgs_and_larkstone" => "false",
          "dead_reckoning" => "false",
        }
      }
    }
  end

  def read_from_cookie
    JSON.parse cookies[:tiny_towns_randomizer]
  end

  def set_all_buildings_to_random
    randomizer["buildings"].each { |key, value| set_building_to_random(key) unless key == "purple" }
  end

  def set_building_to_random(color)
    randomizer["buildings"][color].shuffle!
  end

  def set_all_players_to_random_buildings
    set_building_to_random("purple")
  end

  def set_all_players_active_status(number_of_players)
    randomizer["players"].merge!(randomizer["players"]) do |player_number, player|
      if player_number.to_i > number_of_players.to_i
        { "active" => "false", "hidden" => player["hidden"] }
      else
        { "active" => "true", "hidden" => player["hidden"] }
      end
    end
  end

  def set_all_players_hidden_status
    randomizer["settings"]["hidden_players"] = JSON.generate !YAML.load(randomizer["settings"]["hidden_players"])
    randomizer["players"].merge!(randomizer["players"]) do |player_number, player|
      { "active" => player["active"], "hidden" =>  randomizer["settings"]["hidden_players"] }
    end
  end

  def set_player_to_random_buildings(player_number)
    total_buildings = randomizer["buildings"]["purple"].count
    current_buildings = randomizer["buildings"]["purple"][(2*(player_number-1)) .. (2*(player_number-1))+1]
    unused_buildings = randomizer["buildings"]["purple"][(2*number_of_players)..total_buildings].shuffle
    new_buildings = unused_buildings[0..1]
    new_buildings.each_with_index do |new_building, index|
      building_to_replace = current_buildings[index]
      pos_of_building_to_replace = randomizer["buildings"]["purple"].find_index(building_to_replace)
      pos_of_new_building = randomizer["buildings"]["purple"].find_index(new_building)
      randomizer["buildings"]["purple"][pos_of_building_to_replace] = new_building
      randomizer["buildings"]["purple"][pos_of_new_building] = building_to_replace
    end
  end

  def set_player_hidden_status(player_number)
    randomizer["players"][player_number]["hidden"] = JSON.generate !YAML.load(randomizer["players"][player_number]["hidden"])
  end

  def set_expansion_active_status(expansion)
    randomizer["settings"]["expansions"][expansion] = JSON.generate !YAML.load(randomizer["settings"]["expansions"][expansion])
    update_buildings
  end

  def update_buildings
    updated_buildings = {
      "blue" =>   [ ],
      "red" =>    [ ],
      "orange" => [ ],
      "yellow" => [ ],
      "gray" =>   [ ],
      "black" =>  [ ],
      "green" =>  [ ],
      "purple" => [ ]
    }
    BUILDINGS.each do |expansion, contents|
      if YAML.load(randomizer["settings"]["expansions"][expansion])
        contents.each do |color, buildings|
          updated_buildings[color] = updated_buildings[color] | buildings
        end
      end
    end
    randomizer["buildings"] = updated_buildings
    set_all_buildings_to_random
    set_all_players_to_random_buildings
  end
end
