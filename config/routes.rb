Rails.application.routes.draw do
  root to: 'graphs#index'
  resources :graphs, only: [ :index ]
end
