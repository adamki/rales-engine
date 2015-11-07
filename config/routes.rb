Rails.application.routes.draw do
  namespace :api  do
    namespace :v1 do

      get "/items/most_revenue", to: "items#most_revenue", defaults: {:format => 'json' }
      get "/items/find", to: "items#find",defaults: { :format => 'json' }
      get "/items/find_all", to: "items#find_all",defaults: { :format => 'json' }
      get "/items/random", to: "items#random",defaults: { :format => 'json' }
      resources :items, defaults: { format: :json}, only: [:index, :show] do
        get :invoice_items
        get :merchant
      end

      get "/customers/find", to: "customers#find",defaults: { :format => 'json' }
      get "/customers/find_all", to: "customers#find_all",defaults: { :format => 'json' }
      get "/customers/random", to: "customers#random",defaults: { :format => 'json' }

      get "/customers/:customer_id/favorite_merchant",to: "customers#favorite_merchant", defaults: {:format => 'json'}
      resources :customers, defaults: { format: :json}, only: [:index, :show] do
        get :invoices
        get :transactions
      end

      get "/invoice_items/find", to: "invoice_items#find",defaults: { :format => 'json' }
      get "/invoice_items/find_all", to: "invoice_items#find_all",defaults: { :format => 'json' }
      get "/invoice_items/random", to: "invoice_items#random",defaults: { :format => 'json' }
      resources :invoice_items, defaults: { format: :json}, only: [:index, :show] do
        get :item
        get :invoice
      end

      get "/invoices/find", to: "invoices#find",defaults: { :format => 'json' }
      get "/invoices/find_all", to: "invoices#find_all",defaults: { :format => 'json' }
      get "/invoices/random", to: "invoices#random",defaults: { :format => 'json' }
      resources :invoices, defaults: { format: :json}, only: [:index, :show] do
        get :items
        get :transactions
        get :invoice_items
        get :customer
        get :merchant
      end

      get "/merchants/find", to: "merchants#find",defaults: { :format => 'json' }
      get "/merchants/find_all", to: "merchants#find_all",defaults: { :format => 'json' }
      get "/merchants/random", to: "merchants#random",defaults: { :format => 'json' }

      get "/merchants/:merchant_id/revenue", to: "merchants#revenue",defaults: { :format => 'json' }
      get "/merchants/:merchant_id/favorite_customer", to: "merchants#favorite_customer",defaults: { :format => 'json' }
      get "/merchants/:merchant_id/customers_with_pending_invoices", to: "merchants#customers_with_pending_invoices",defaults: { :format => 'json' }

      get "/merchants/most_revenue", to: "merchants#most_revenue",defaults: { :format => 'json' }
      get "/merchants/most_items", to: "merchants#most_items",defaults: { :format => 'json' }
      get "/merchants/revenue", to: "merchants#revenue",defaults: { :format => 'json' }

      resources :merchants, defaults: { format: :json}, only: [:index, :show] do
        get :items
        get :invoices
      end

      get "/transactions/find", to: "transactions#find",defaults: { :format => 'json' }
      get "/transactions/find_all", to: "transactions#find_all",defaults: { :format => 'json' }
      get "/transactions/random", to: "transactions#random",defaults: { :format => 'json' }
      resources :transactions, defaults: { format: :json}, only: [:index, :show] do
        get :invoice
      end
    end
  end
end
