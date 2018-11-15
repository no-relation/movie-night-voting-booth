Rails.application.routes.draw do
  root 'sessions#new'

  match '/votes/destroy_all', to: 'votes#destroy_all', via: :delete
  resources :votes, except: :index do 
    get 'tally', :on => :collection
  end 
  
  match '/movies/destroy_all', to: 'movies#destroy_all', via: :delete
  resources :movies, except: [:new, :update] do
    get 'find', :on => :collection
  end

  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
