Rails.application.routes.draw do
  root 'posts#new'

  get    '/signup',    to:  'users#new'
  post   '/signup',    to:  'users#create'
  get    '/login',     to:  'sessions#new'
  post   '/login',     to:  'sessions#create'
  delete '/logout',    to:  'sessions#destroy'

  resources :users,    only: [:new, :create]
  resources :posts,    only: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
