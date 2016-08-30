Rails.application.routes.draw do

  get 'pages/contact'
  get 'pages/about'

  resources :bookings, only: :show

  resources :homes do
    resources :bookings, only: [:new, :create]
  end

  devise_for :users

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
end
