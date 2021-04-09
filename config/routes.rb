Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :public_rooms do
    resources :public_messages
  end
  root 'public_rooms#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post '/public_rooms/:id/public_messages', to: 'public_messages#creating'
end
