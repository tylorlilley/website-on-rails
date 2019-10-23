Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/follow', to: 'static_pages#follow'
  get '/.well-known/acme-challenge/tBc2N67HZ66xVhKf4LBabXkwHiCX3XR78YXsM2grPVc', to: 'static_pages#encrypt1'
  get '/.well-known/acme-challenge/E9i4kw3XP43Y2CQKiP_bvKFO_xjHdBKLb9dMz2Tk9gA', to: 'static_pages#encrypt2'
  get '/.well-known/acme-challenge/ZEHgr2pKwlhRtFqILnwlPGrHgs8jTOayLbEOkyztF0I', to: 'static_pages#encrypt3'
  resources :posts
  resources :games
end
