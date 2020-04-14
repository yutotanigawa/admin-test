Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :users


  root 'home#top'
  get 'home/about'


  resources :users,only: [:show,:index,:edit,:update]
  resources :books


end
