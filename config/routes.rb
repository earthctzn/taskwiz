Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  
  resources :users do
    resources :tasks, only: [:new, :edit, :update, :show, :index, :create]
    resources :comments, only: [:new, :edit, :update, :show, :index, :create, :delete]
  end

  resources :tasks, only: [:new, :edit, :show, :index, :update, :create, :delete]
  resources :comments, only: [:new, :edit, :show, :index, :update, :create, :delete]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  
  get '/auth/facebook/callback', to: 'sessions#fbauth'
  get 'auth/failure', to: redirect('/')

  
end
