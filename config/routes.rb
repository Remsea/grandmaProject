Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :grandmas do
    resources :transactions, only: [:create]
  end

  resources :users
end
