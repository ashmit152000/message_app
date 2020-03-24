Rails.application.routes.draw do

  get 'chatroom/index'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "chatroom#index"

  get 'login', to: "sessions#new"
end
