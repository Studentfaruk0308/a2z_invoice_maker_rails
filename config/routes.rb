Rails.application.routes.draw do
  resources :profiles
  resources :invoices
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
