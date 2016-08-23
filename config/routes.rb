Rails.application.routes.draw do

  resources :homes do
    resources :bookings, only: [:new, :create, :show]
  end

  devise_for :users

  root to: 'pages#home'
end
