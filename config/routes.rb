Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'register', to: 'devise/registrations#create'
  end


  root 'home#index' 
  get '/dashboard' => 'dashboard#index'
  get '/dashboard/search' => 'dashboard#search', as: 'dashboard/search'

end
