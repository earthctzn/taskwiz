Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :tasks
  
  resources :users do
    resources :tasks, only: [:edit, :show]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # post '/users/new', to: 'users#create'
  
  get '/auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  
end
