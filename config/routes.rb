Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/edit'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root to: 'users#show'
  get 'users/show'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
