Rails.application.routes.draw do
  resources :users
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  
  get 'login', to: 'sessions#login'
  post 'create', to: 'sessions#create'
  get 'home', to: 'users#home'
end
