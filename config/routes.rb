Rails.application.routes.draw do
  evise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_for :users
  root to: "tweets#index"
  
end
