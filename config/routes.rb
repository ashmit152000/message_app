Rails.application.routes.draw do

  get 'chatroom/index'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "chatroom#index"

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  post 'signup', to: "sessions#ajaxreply"
  delete 'logout', to: 'sessions#destroy'
  resources :users
  post 'messages', to: "messages#create"

  mount ActionCable.server, at: '/cable'
end
