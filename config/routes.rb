Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'register', to: 'devise/registrations#create'
  end


  root 'home#index' 
  get '/dashboard' => 'dashboard#index'
  get '/dashboard/search' => 'dashboard#search', as: 'dashboard/search'

  get '/favorites/saverecipe' => 'favorites#save_recipe', as: 'favorites/save_recipe'


  post '/favorites' => 'favorites#create', as: 'create_favorite'
  get '/favorites/new' => 'favorites#new', as: 'new_favorite'
  # get '/favorites' => 'favorites#new'
  # post '/favorites' => 'favorites#create'
end
