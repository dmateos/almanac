Rails.application.routes.draw do
  root to: "pages#index"

  get "listyourorganisation" => "pages#list_your_org"

  resources :organisations
  resources :tags
  resources :taggings
end
