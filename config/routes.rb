Rails.application.routes.draw do
  get 'user/index'
  get 'user/checkin'
  get 'user/checkout'
  get 'user/create_room'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  resources :user, only: [:show, :index] do

    post '/checkin', to: 'user#checkin'
    post '/checkin', to: 'user#checkin'
    resources :room, only: [:create, :index]

  end

end
