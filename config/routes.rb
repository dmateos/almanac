Rails.application.routes.draw do
  root to: "pages#index"
  get "listyourorganisation" => "pages#list_your_org"

  resources :organisations
  resources :subjects
  resource :search

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  get "register" => "users#new"
  post "register" => "users#create"
end
