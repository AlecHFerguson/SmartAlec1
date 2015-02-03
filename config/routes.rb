Rails.application.routes.draw do
  match '/',     to: 'maps#index',              via: :get
  match '/echo', to: 'echo#index', via: :get
end
