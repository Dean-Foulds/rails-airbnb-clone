Rails.application.routes.draw do

  get 'pages/contact'
  get 'pages/about'

  resources :bookings, only: :show

  resources :homes do
    resources :bookings, only: [:index, :new, :create]
    resources :home_reviews, only: [:create]
  end

  get '/profile', to: 'profiles#show', as: :profile
  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile

  devise_for :users

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
end
