Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :profiles, only: [:show]

  resources :races do
    resources :comments
  end
end
