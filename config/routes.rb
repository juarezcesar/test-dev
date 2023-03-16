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
    post '/create_invoices', to: 'user#create_invoices'
    post '/set_invoice_as_paid', to: 'user#set_invoice_as_paid'
    resources :room, only: [:create, :index]

  end

end
