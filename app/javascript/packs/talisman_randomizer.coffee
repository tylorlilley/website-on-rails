# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# console.log("talisman randomizer js file loaded")

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

CHARACTERS =
  base:             [ "Assassin", "Druid", "Dwarf", "Elf", "Ghoul", "Minstrel", "Monk", "Priest",
                      "Prophetess", "Sorceress", "Troll", "Thief", "Wizard", "Warrior" ]
  reaper:           [ "Dark Cultist", "Knight", "Merchant", "Sage" ]
  dungeon:          [ "Amazon", "Gladiator", "Gypsy", "Philosopher", "Swashbuckler" ]
  frostmarch:       [ "Leprechaun", "Necromancer", "Ogre Chieftan", "Warlock" ]
  highland:         [ "Alchemist", "Highlander", "Rogue", "Sprite", "Valkyrie", "Vampiress" ]
  sacred_pool:      [ "Chivalric Knight", "Cleric", "Dread Knight", "Magus" ]
  dragon:           [ "Dragon Hunter", "Dragon Priestess", "Dragon Rider", "Fire Wizard", "Minotaur "]
  blood_moon:       [ "Doomsayer", "Grave Robber", "Vampire Hunter" ]
  city:             [ "Bounty Hunter", "Cat Burglar", "Elementalist", "Spy", "Tavern Maid", "Tinkerer"]
  firelands:        [ "Dervish", "Jin Blooded", "Nomad", "Warlord" ]
  woodland:         [ "Ancient Oak", "Leywalker", "Scout", "Spider Queen", "Totem Warrior" ]
  harbinger:        [ "Ascendant Divine", "Celestial", "Possessed" ]
  cataclysm:        [ "Arcane Scion", "Barbarian", "Black Knight", "Mutant", "Scavenger" ]
  nether_realm:     [ ]
  realms_unraveled: [ ]
  digital_edition:  [ "Pirate", "Ninja", "Exorcist", "Courtesan", "Devil's Minion", "Genie", "Martyr",
                      "Gambler", "Black Witch", "Apprentice Mage", "Shape Shifter", "Shaman", "Illusionist",
                      "Jester", "Goblin Shaman", "Woodsman", "Pathfinder", "Samurai", "Martial Artist",
                      "Witch Doctor", "Sacaren" ]
ENDINGS = # This is not to be used but is for reference purposes
  base:             [ "Crown of Command" ]
  reaper:           [ "Danse Macabre" ]
  dungeon:          [ ]
  frostmarch:       [ "Crown and Sceptre", "Ice Queen", "Warlock Quests" ]
  highland:         [ "Battle Royale", "Eagle King", "Hand of Doom" ]
  sacred_pool:      [ "Demon Lord", "Judgment Day", "Sacred Pool" ]
  dragon:           [ "Domain of Dragons", "Dragon King", "Dragon Slayers" ]
  blood_moon:       [ "Blood Moon Werewolf", "Horrible Black Void", "Lightbearers" ]
  city:             [ "Thieves' Guild", "Merchants' Guild", "Assassins' Guild" ]
  firelands:        [ "Crown of Flame", "Spreading Flames", "A Hero Rises"]
  woodland:         [ "Judged by Fate", "Wanderlust", "War of Seasons" ]
  harbinger:        [ "Armageddon Crown", "End of Days" ]
  cataclysm:        [ "Cult of the Damned", "Lands of Wonder", "The Eternal Crown", "The One Talisman" ]
  nether_realm:     [ "Pandora's Box", "The Gauntlet", "The Hunt" ]
  realms_unraveled: [ "Nether Portal", "Lord of Darkness", "Realmwalkers" ]
  digital_edition:  [ ]

REVEALED_ONLY_ENDINGS =
  base:             [ ]
  reaper:           [ ]
  dungeon:          [ ]
  frostmarch:       [ "Warlock Quests" ]
  highland:         [ ]
  sacred_pool:      [ "Sacred Pool" ]
  dragon:           [ "Domain of Dragons", "Dragon Slayers" ]
  blood_moon:       [ "Lightbearers" ]
  city:             [ "Merchants' Guild", "Assassins' Guild" ]
  firelands:        [ "A Hero Rises"]
  woodland:         [ "Wanderlust" ]
  harbinger:        [ "End of Days" ]
  cataclysm:        [ "Lands of Wonder", "The One Talisman" ]
  nether_realm:     [ "The Gauntlet", "The Hunt" ]
  realms_unraveled: [ "Realmwalkers" ]
  digital_edition:  [ ]
HIDDEN_ONLY_ENDINGS =
  base:             [ ]
  reaper:           [ ]
  dungeon:          [ ]
  frostmarch:       [ ]
  highland:         [ ]
  sacred_pool:      [ ]
  dragon:           [ ]
  blood_moon:       [ "Blood Moon Werewolf", "Horrible Black Void" ]
  city:             [ ]
  firelands:        [ "Crown of Flame", "Spreading Flames" ]
  woodland:         [ "Judged by Fate" ]
  harbinger:        [ ]
  cataclysm:        [ "Cult of the Damned" ]
  nether_realm:     [ ]
  realms_unraveled: [ "Lord of Darkness" ]
  digital_edition:  [ ]
BOTH_ENDINGS =
  base:             [ "Crown of Command" ]
  reaper:           [ "Danse Macabre" ]
  dungeon:          [ ]
  frostmarch:       [ "Crown and Sceptre", "Ice Queen" ]
  highland:         [ "Battle Royale", "Eagle King", "Hand of Doom" ]
  sacred_pool:      [ "Demon Lord", "Judgment Day", ]
  dragon:           [ "Dragon King" ]
  blood_moon:       [ ]
  city:             [ "Thieves' Guild" ]
  firelands:        [ ]
  woodland:         [ "War of Seasons" ]
  harbinger:        [ "Armageddon Crown" ]
  cataclysm:        [ "The Eternal Crown" ]
  nether_realm:     [ "Pandora's Box" ]
  realms_unraveled: [ "Nether Portal" ]
  digital_edition:  [ ]


TalismanRandomizer =
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
    elements[0].getElementsByClassName("text")[0].innerHTML = PLAYER_BUILDINGS[number*2-2]
    elements[1].getElementsByClassName("text")[0].innerHTML = PLAYER_BUILDINGS[number*2-1]

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

  change_enabled_expansions: (expansion) ->
    toggle_expansion(expansion)

  toggle_expansion: (expansion) ->
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

$(document).on "click", "input[type=checkbox][name=enabled-expansions]", (event) ->
  expansion = this.getAttribute('value')
  TalismanRandomizer.change_enabled_expansions(expansion)
