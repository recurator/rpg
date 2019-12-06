Rails.application.routes.draw do
  resources :character_types
  devise_for :users

  as :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  root to: "pages#index"

end
