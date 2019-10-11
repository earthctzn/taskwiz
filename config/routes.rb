Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :tasks, only: [:edit, :show]
  end
  resources :sessions, only: [new, :create, :destroy]
  resources :tasks
  get '/auth/facebook/callback' => 'sessions#create'

  root 'welcome#home'
end
