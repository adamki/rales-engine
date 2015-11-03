Rails.application.routes.draw do
  namespace :api  do
    namespace :v1 do
      resources :items, defaults: { format: :json}
      resources :customer, defaults: { format: :json}
      resources :invoice_items, defaults: { format: :json}
      resources :invoices, defaults: { format: :json}
      resources :merchants, defaults: { format: :json}
      resources :transactions, defaults: { format: :json}
    end
  end
end
