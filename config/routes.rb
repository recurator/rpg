Rails.application.routes.draw do
  resources :character_types
  devise_for :users

  root to: "pages#index"

end
