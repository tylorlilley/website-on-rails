/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/tiny_towns_randomizer.coffee");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/tiny_towns_randomizer.coffee":
/*!***********************************************************!*\
  !*** ./app/javascript/packs/tiny_towns_randomizer.coffee ***!
  \***********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

var BUILDINGS, HIDE_PLAYERS, PLAYER_BUILDINGS, TOTAL_PLAYERS, shuffle, swap;

shuffle = function(a) {
  var i, j, t;
  i = a.length;
  while (--i > 0) {
    j = ~~(Math.random() * (i + 1));
    t = a[j];
    a[j] = a[i];
    a[i] = t;
  }
  return a;
};

swap = function(array, a, b) {
  var index_of_first, index_of_second;
  index_of_first = array.indexOf(a);
  index_of_second = array.indexOf(b);
  array[index_of_first] = array[index_of_second];
  return array[index_of_second] = a;
};

TOTAL_PLAYERS = 4;

HIDE_PLAYERS = true;

BUILDINGS = {
  blue: ["Cottage"],
  red: ["Farm", "Greenhouse", "Orchard", "Granary"],
  orange: ["Cloitser", "Abbey", "Temple", "Chapel"],
  yellow: ["Tailor", "Theater", "Bakery", "Merchant"],
  gray: ["Millstone", "Shed", "Well", "Fountain"],
  black: ["Factory", "Trading Post", "Bank", "Warehouse"],
  green: ["Inn", "Almshouse", "Feast Hall", "Tavern"]
};

PLAYER_BUILDINGS = ["Obelisk of the Crescent", "Cathedral of Caterina", "Opaleye's Watch", "Archive of the Second Age", "The Starloom", "The Sky Baths", "Architect's Guild", "Grand Mausoleum of the Rodina", "Silva Forum", "Shrine of the Elder Tree", "Barrett Castle", "Grove University", "Statue of the Bondmaker", "Fort Ironweed"];

App.TinyTownsRandomizer = {
  randomize_building: function(color) {
    var element;
    element = document.getElementsByClassName(color)[0].getElementsByClassName("text")[0];
    element.innerHTML = shuffle(BUILDINGS[color])[0];
    return element.innerHTML;
  },
  randomize_all_player_buildings: function() {
    var k, results, x;
    PLAYER_BUILDINGS = shuffle(PLAYER_BUILDINGS);
    results = [];
    for (x = k = 1; k <= 6; x = ++k) {
      results.push(App.TinyTownsRandomizer.set_player_buildings(x));
    }
    return results;
  },
  randomize_player_buildings: function(number) {
    var buildings, old_building1, old_building2;
    buildings = shuffle(PLAYER_BUILDINGS.slice(TOTAL_PLAYERS * 2));
    old_building1 = PLAYER_BUILDINGS[number * 2 - 2];
    old_building2 = PLAYER_BUILDINGS[number * 2 - 1];
    swap(PLAYER_BUILDINGS, old_building1, buildings[0]);
    swap(PLAYER_BUILDINGS, old_building2, buildings[1]);
    return App.TinyTownsRandomizer.set_player_buildings(number);
  },
  set_player_buildings: function(number) {
    var elements;
    elements = document.getElementById("player-" + number).getElementsByClassName("purple");
    elements[0].innerHTML = PLAYER_BUILDINGS[number * 2 - 2];
    return elements[1].innerHTML = PLAYER_BUILDINGS[number * 2 - 1];
  },
  toggle_all_player_buildings: function() {
    var k, l, results, results1, x;
    HIDE_PLAYERS = !HIDE_PLAYERS;
    if (HIDE_PLAYERS) {
      results = [];
      for (x = k = 1; k <= 6; x = ++k) {
        results.push(App.TinyTownsRandomizer.hide_player_buildings(x));
      }
      return results;
    } else {
      results1 = [];
      for (x = l = 1; l <= 6; x = ++l) {
        results1.push(App.TinyTownsRandomizer.reveal_player_buildings(x));
      }
      return results1;
    }
  },
  toggle_player_buildings: function(number) {
    return $("#player-" + number + " .purple").toggleClass("hidden");
  },
  reveal_player_buildings: function(number) {
    return $("#player-" + number + " .purple").removeClass("hidden");
  },
  hide_player_buildings: function(number) {
    return $("#player-" + number + " .purple").addClass("hidden");
  },
  randomize_until_different_building: function(color) {
    var element, old_building;
    element = document.getElementsByClassName(color)[0].getElementsByClassName("text")[0];
    old_building = element.innerHTML;
    while (old_building === App.TinyTownsRandomizer.randomize_building(color)) {
      continue;
    }
    return element.innerHTML;
  },
  randomize_all: function() {
    App.TinyTownsRandomizer.randomize_all_buildings();
    App.TinyTownsRandomizer.randomize_all_player_buildings();
    return App.TinyTownsRandomizer.change_total_players(4);
  },
  randomize_all_buildings: function() {
    var results, x, y;
    results = [];
    for (x in BUILDINGS) {
      y = BUILDINGS[x];
      results.push(App.TinyTownsRandomizer.randomize_building(x));
    }
    return results;
  },
  change_total_players: function(number) {
    var k, results, x;
    TOTAL_PLAYERS = number;
    results = [];
    for (x = k = 1; k <= 6; x = ++k) {
      results.push(App.TinyTownsRandomizer.toggle_player(x));
    }
    return results;
  },
  toggle_player: function(number) {
    if (number > TOTAL_PLAYERS) {
      return $("#player-" + number).hide();
    } else {
      return $("#player-" + number).show();
    }
  }
};

$(document).on("click", "[data-behavior~=randomize-building]", function(event) {
  var color;
  event.preventDefault();
  color = this.getAttribute('data-color');
  return App.TinyTownsRandomizer.randomize_until_different_building(color);
});

$(document).on("click", "[data-behavior~=randomize-player]", function(event) {
  var number;
  event.preventDefault();
  number = this.getAttribute('data-number');
  return App.TinyTownsRandomizer.randomize_player_buildings(number);
});

$(document).on("click", "[data-behavior~=reveal-player]", function(event) {
  var number;
  event.preventDefault();
  number = this.getAttribute('data-number');
  return App.TinyTownsRandomizer.toggle_player_buildings(number);
});

$(document).on("click", "[data-behavior~=reveal-all-players]", function(event) {
  event.preventDefault();
  return App.TinyTownsRandomizer.toggle_all_player_buildings();
});

$(document).on("click", "[data-behavior~=randomize-all-players]", function(event) {
  event.preventDefault();
  return App.TinyTownsRandomizer.randomize_all_player_buildings();
});

$(document).on("click", "[data-behavior~=randomize-all-buildings]", function(event) {
  event.preventDefault();
  return App.TinyTownsRandomizer.randomize_all_buildings();
});

$(document).on("turbolinks:load", function() {
  App.TinyTownsRandomizer.randomize_all();
  return $('input[type=radio][name=total-players]').change(function() {
    var number;
    number = this.value;
    return App.TinyTownsRandomizer.change_total_players(number);
  });
});


/***/ })

/******/ });
//# sourceMappingURL=tiny_towns_randomizer-7673cf76261342c28241.js.map