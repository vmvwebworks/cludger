Rails.application.routes.draw do
  #get 'rooms/show'
  root to: 'home#index'
  get 'rooms/show', to: 'rooms#show'
  get 'conversation/show', to: 'conversation#show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
