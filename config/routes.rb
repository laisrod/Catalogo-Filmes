Rails.application.routes.draw do
  resources :movies do
    member do
      get :publish
    end
  end
  resources :directors
  resources :genres
  root 'home#index'
end
