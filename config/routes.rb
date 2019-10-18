Rails.application.routes.draw do
  resources :users
  resources :bets
  resources :rounds
  resources :locations
  get 'locations/:id/weather', to: 'locations#weather'
  get 'locations/:id/forecast', to: 'locations#forecast'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
