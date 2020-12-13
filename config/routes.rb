Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  post '/tweets/guest_sign_in', to: 'tweets#new_guest'
  root to: "tweets#index"
  
  resources :users, only: :new
  resources :tweets do
    resources :comments, only: :create
  end
  
  resources :categories, only: :show

  resources :messages, only: :create
  resources :rooms, only: [:create, :show]
end
