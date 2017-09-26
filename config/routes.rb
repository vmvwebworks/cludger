Rails.application.routes.draw do
  #get 'rooms/show'
  root to: 'rooms#show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations' }
  #get '/', to: 'home#index' #:as => "root"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
