Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controllers#method'
  # READ - index
  get 'tasks', to: 'tasks#index'
  # READ - show
  get 'tasks/:id', to: 'tasks#show', as: :task 
  # get 'tasks/:id', to: 'tasks#show'

end
