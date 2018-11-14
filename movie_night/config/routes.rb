Rails.application.routes.draw do
  resources :votes do 
    get 'tally', :on => :collection
  end
  resources :movies do
    get 'find', :on => :collection
  end
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
