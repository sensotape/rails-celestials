Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :celestials
  resources :users, only: [:edit, :update, :show]
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
end
