# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# console.log("tt randomizer js file loaded")

shuffle = (a) ->
  i = a.length
  while --i > 0
    j = ~~(Math.random() * (i + 1)) # ~~ is a common optimization for Math.floor
    t = a[j]
    a[j] = a[i]
    a[i] = t
  a

swap = (array, a, b) ->
  index_of_first = array.indexOf(a)
  index_of_second = array.indexOf(b)
  array[index_of_first] = array[index_of_second]
  array[index_of_second] = a

TOTAL_PLAYERS = 4
HIDE_PLAYERS = true

BUILDINGS =
  blue:   [ "Cottage" ]
  red:    [ "Farm", "Greenhouse", "Orchard", "Granary" ]
  orange: [ "Cloitser", "Abbey", "Temple", "Chapel" ]
  yellow: [ "Tailor", "Theater", "Bakery", "Merchant" ]
  gray:   [ "Millstone", "Shed", "Well", "Fountain" ]
  black:  [ "Factory", "Trading Post", "Bank", "Warehouse" ]
  green:  [ "Inn", "Almshouse", "Feast Hall", "Tavern" ]
PLAYER_BUILDINGS =
  [ "Obelisk of the Crescent", "Cathedral of Caterina", "Opaleye's Watch",
    "Archive of the Second Age", "The Starloom", "The Sky Baths", "Architect's Guild",
    "Grand Mausoleum of the Rodina", "Silva Forum", "Shrine of the Elder Tree",
    "Barrett Castle", "Grove University", "Statue of the Bondmaker", "Fort Ironweed" ]


TinyTownsRandomizer =
  randomize_building: (color) ->
    element = document.getElementsByClassName(color)[0].getElementsByClassName("text")[0]
    element.innerHTML = shuffle(BUILDINGS[color])[0]
    element.innerHTML

  randomize_all_player_buildings: ->
    PLAYER_BUILDINGS = shuffle(PLAYER_BUILDINGS)
    TinyTownsRandomizer.set_player_buildings(x) for x in [1..6]

  randomize_player_buildings: (number) ->
    buildings = shuffle(PLAYER_BUILDINGS[TOTAL_PLAYERS*2..])
    old_building1 = PLAYER_BUILDINGS[number*2-2]
    old_building2 = PLAYER_BUILDINGS[number*2-1]
    swap(PLAYER_BUILDINGS, old_building1, buildings[0])
    swap(PLAYER_BUILDINGS, old_building2, buildings[1])
    TinyTownsRandomizer.set_player_buildings (number)

  set_player_buildings: (number) ->
    elements = document.getElementById("player-#{number}").getElementsByClassName("purple")
    elements[0].innerHTML = PLAYER_BUILDINGS[number*2-2]
    elements[1].innerHTML = PLAYER_BUILDINGS[number*2-1]

  toggle_all_player_buildings: ->
    HIDE_PLAYERS = !HIDE_PLAYERS
    if HIDE_PLAYERS
      TinyTownsRandomizer.hide_player_buildings(x) for x in [1..6]
    else
      TinyTownsRandomizer.reveal_player_buildings(x) for x in [1..6]

  toggle_player_buildings: (number) ->
    $("#player-#{number} .purple").toggleClass("unrevealed")

  reveal_player_buildings: (number) ->
    $("#player-#{number} .purple").removeClass("unrevealed")

  hide_player_buildings: (number) ->
    $("#player-#{number} .purple").addClass("unrevealed")

  randomize_until_different_building: (color) ->
    element = document.getElementsByClassName(color)[0].getElementsByClassName("text")[0]
    old_building = element.innerHTML
    continue while old_building == TinyTownsRandomizer.randomize_building(color)
    return element.innerHTML

  randomize_all: ->
    TinyTownsRandomizer.randomize_all_buildings()
    TinyTownsRandomizer.randomize_all_player_buildings()
    TinyTownsRandomizer.change_total_players(4)

  randomize_all_buildings: ->
    TinyTownsRandomizer.randomize_building(x) for x,y of BUILDINGS

  change_total_players: (number) ->
    TOTAL_PLAYERS = number
    TinyTownsRandomizer.toggle_player(x) for x in [1..6]

  toggle_player: (number) ->
    if number > TOTAL_PLAYERS
      $("#player-#{number}").hide()
    else
      $("#player-#{number}").show()

$(document).on "click", "[data-behavior~=randomize-building]", (event) ->
  event.preventDefault()
  color = this.getAttribute('data-color')
  TinyTownsRandomizer.randomize_until_different_building(color)

$(document).on "click", "[data-behavior~=randomize-player]", (event) ->
  event.preventDefault()
  number = this.getAttribute('data-number')
  TinyTownsRandomizer.randomize_player_buildings(number)

$(document).on "click", "[data-behavior~=reveal-player]", (event) ->
  event.preventDefault()
  number = this.getAttribute('data-number')
  TinyTownsRandomizer.toggle_player_buildings(number)

$(document).on "click", "[data-behavior~=reveal-all-players]", (event) ->
  event.preventDefault()
  TinyTownsRandomizer.toggle_all_player_buildings()

$(document).on "click", "[data-behavior~=randomize-all-players]", (event) ->
  event.preventDefault()
  TinyTownsRandomizer.randomize_all_player_buildings()

$(document).on "click", "[data-behavior~=randomize-all-buildings]", (event) ->
  event.preventDefault()
  TinyTownsRandomizer.randomize_all_buildings()

$(document).ready ->
  TinyTownsRandomizer.randomize_all()

$(document).on "click", "input[type=radio][name=total-players]", (event) ->
  number = this.getAttribute('value')
  TinyTownsRandomizer.change_total_players(number)
