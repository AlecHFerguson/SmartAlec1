Rails.application.routes.draw do
  match '/', to: 'maps#index', via: :get
end
