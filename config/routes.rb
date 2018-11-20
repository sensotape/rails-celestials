Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :celestials, except: :show
  resources :users, only: [:edit, :update, :show]
  resources :messages, only: [:index, :show]
end
