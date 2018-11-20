Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :celestials, except: :show
  get 'users/:id', to: 'users#show', as: :user
  resources :messages, only: [:index, :show]
end
