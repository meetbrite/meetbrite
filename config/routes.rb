Rails.application.routes.draw do
  resources :group_messages
  resources :direct_messages
  resources :event_users
  resources :events
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get '/users/:first_id/direct_message/:second_id', to: 'direct_messages#display_messages', as: 'display_direct_messages'
  get '/users/:user_id/group_message/:event_id', to: 'group_messages#display_messages', as: 'display_group_messages'

  get "/events/:event_id/register", to: "events#register", as: 'event_register_user'
  get "/events/:event_id/unregister", to: "events#unregister", as: 'event_unregister_user'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout' #make it post or delete



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 