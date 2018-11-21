Rails.application.routes.draw do
  devise_for :users
  resources :materials
  root to: "home#index"
end
