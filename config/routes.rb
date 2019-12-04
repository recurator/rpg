Rails.application.routes.draw do
  resources :character_attributes
  resources :character_types
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#index"

end
