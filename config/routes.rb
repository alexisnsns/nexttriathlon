Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get '/race/:id/bookmark', to: 'races#bookmark', as: 'bookmark'

  resources :profiles, only: [:show]

  resources :races do
    resources :comments
  end
end
