Rails.application.routes.draw do
  namespace :api  do
    namespace :v1 do

      get "/items/find", to: "items#find",defaults: { :format => 'json' }
      get "/items/find_all", to: "items#find_all",defaults: { :format => 'json' }
      get "/items/random", to: "items#random",defaults: { :format => 'json' }
      resources :items, defaults: { format: :json}, only: [:index, :show]


      get "/customer/find", to: "customers#find",defaults: { :format => 'json' }
      get "/customers/find_all", to: "customers#find_all",defaults: { :format => 'json' }
      get "/customers/random", to: "customers#random",defaults: { :format => 'json' }
      resources :customer, defaults: { format: :json}, only: [:index, :show]

      resources :invoice_items, defaults: { format: :json}, only: [:index, :show]
      resources :invoices, defaults: { format: :json}, only: [:index, :show]
      resources :merchants, defaults: { format: :json}, only: [:index, :show]
      resources :transactions, defaults: { format: :json}, only: [:index, :show]
    end
  end
end
