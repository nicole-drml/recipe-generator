Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'register', to: 'devise/registrations#create'
  end

  root 'home#index'
  get '/dashboard' => 'dashboard#index'
  get '/dashboard/search' => 'dashboard#search', as: 'dashboard/search'
  get '/dashboard/random_recipe', to: 'random_recipe#index', as: 'random_recipe'
  # get '/favorites' => 'favorites#new'
  # post '/favorites' => 'favorites#create'
end
