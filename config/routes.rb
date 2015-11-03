Rails.application.routes.draw do
  root to: "pages#index"

  resources :organisations
  resources :tags
  resources :taggings
end
