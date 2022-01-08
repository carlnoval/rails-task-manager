Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # READ - index
  get 'tasks', to: 'tasks#index'
  # READ - show
  # get 'tasks/:id', to: 'task#show', as 'restaurant'
  get 'tasks/:id', to: 'tasks#show'

end
