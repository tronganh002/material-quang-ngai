Rails.application.routes.draw do
  devise_for :users
  resources :materials
  resources :revenues
  resources :statitic_charts
  get "admin/96JUDA7HYPFS9QFWBWFD5EYQG321S4BM16DV907H4SS7IEE8F47GX081ZIYUWD5G7ZVM54IYACEIQBX6", to: "admin_registrations#new"
  post "admin/23D087AH2F7UVDTR4KZLMQHBFCL3J8QRW1CCE3BKOAQTPU42Y8VSV4RBD4W6K4GSX8PQU4S9WN5H2OPR", to: "admin_registrations#create", as: :admin_registration_path
  root to: "home#index"
  match '*a', :to => 'errors#routing', via: :get
end
