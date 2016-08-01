Rails.application.routes.draw do
	root 'users#index'
	
	resources :attractions
	resources :users
	resources :rides
	
	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create'
	delete '/logout', to: 'sessions#delete'
end