Rails.application.routes.draw do
  resources :votes do 
    get 'tally', :on => :collection
  end
  resources :movies do
    get 'find', :on => :collection
    get 'search', :on => :collection
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
