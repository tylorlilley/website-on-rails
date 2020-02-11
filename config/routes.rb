Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/follow', to: 'static_pages#follow'
  get '/index', to: 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/randomizers/tiny_towns', to: 'randomizers#tiny_towns'
  get '/randomizers/talisman', to: 'randomizers#talisman'
  resources :posts
  resources :games
end
