Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/follow', to: 'static_pages#follow'
  get '/index', to: 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/randomizers/tiny_towns', to: 'tiny_towns_randomizer#index'
  get '/randomizers/tiny_towns/randomize_all_buildings', to: 'tiny_towns_randomizer#randomize_all_buildings'
  get '/randomizers/tiny_towns/randomize_building', to: 'tiny_towns_randomizer#randomize_building'
  get '/randomizers/tiny_towns/randomize_all_players', to: 'tiny_towns_randomizer#randomize_all_players'
  get '/randomizers/tiny_towns/randomize_player', to: 'tiny_towns_randomizer#randomize_player'
  get '/randomizers/tiny_towns/randomize_all', to: 'tiny_towns_randomizer#randomize_all'
  get '/randomizers/tiny_towns/toggle_all_players', to: 'tiny_towns_randomizer#toggle_all_players'
  get '/randomizers/tiny_towns/toggle_player', to: 'tiny_towns_randomizer#toggle_player'
  resources :posts
  resources :games
end
