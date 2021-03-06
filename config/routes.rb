Rails.application.routes.draw do


  get 'pages/about'

  resources :homes do
    resources :bookings, only: [:index, :new, :create,]
    resources :home_reviews, only: [:create]
  end

  resources :bookings, only: [:destroy]

  get '/profile', to: 'profiles#show', as: :profile
  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile
  get '/contact', to: 'messages#new', as: :contact
  post '/contact', to: 'messages#create', as: :update_contact

  devise_for :users

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
end
