Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"

  get "listyourorganisation" => "pages#list_your_org"

  resources :organisations
end
