Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  resources :owners, only: [:show] do

    get '/dashboard', to: 'owners#dashboard'
    post '/create_invoices', to: 'owners#create_invoices'
    post '/set_invoice_as_paid', to: 'owners#set_invoice_as_paid'
    resources :rooms, only: [:new, :create]
  end

  resources :guests, only: [:show] do

    get '/dashboard', to: 'guests#dashboard'
    post '/checkin', to: 'guests#checkin'
    post '/checkout', to: 'guests#checkout'

  end

end
