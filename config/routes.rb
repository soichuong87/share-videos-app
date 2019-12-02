Rails.application.routes.draw do
  root to: 'videos#index'
  devise_for :users, controllers: {sessions: "sessions"}
  get "/share", to: 'videos#new'
  resources :videos, only: [:index, :create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
