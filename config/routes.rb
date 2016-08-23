Rails.application.routes.draw do

  resources :homes, do
    resources :bookings, only: [:new, :create, :show]
  end

  devise_for :users
  root to: 'pages#home'
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

