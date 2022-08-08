Rails.application.routes.draw do
  root to: 'users#show'
  get 'users/show'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
