Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  resources :owner, only: [:show] do

    get '/dashboard', to: 'owner#dashboard'
    post '/create_invoices', to: 'owner#create_invoices'
    post '/set_invoice_as_paid', to: 'owner#set_invoice_as_paid'
    resources :room, only: [:new, :create]
  end

  resources :guest, only: [:show] do

    get '/dashboard', to: 'guest#dashboard'
    post '/checkin', to: 'guest#checkin'
    post '/checkout', to: 'guest#checkout'

  end

end
