Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customer
      resources :invoice
      resources :invoice_item
      resources :item
      resources :merchant
      resources :transaction
    end
  end
end
