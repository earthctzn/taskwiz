Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  
  resources :users do
    resources :tasks, except: [:destroy]
    resources :comments, except: [:index, :show]
  end

  resources :tasks, only: [:show, :index, :destroy] do
    resources :comments, except: [:index]
  end
  resources :comments, only: [:index, :show]

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  
  get '/auth/facebook/callback', to: 'sessions#fbauth'
  get 'auth/failure', to: redirect('/')

  
end
