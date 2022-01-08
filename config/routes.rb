Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controllers#method'

  # CREATE
  # this needs to be before 'tasks#show' route, otherwise 'tasks/new' will be treated as an id
  get 'tasks/new', to: 'tasks#new'
  post 'tasks', to: 'tasks#create'

  # READ - index
  get 'tasks', to: 'tasks#index'
  # READ - show
  get 'tasks/:id', to: 'tasks#show', as: :task  # url after cliking link - http://localhost:3000/tasks/id
  # get 'tasks/:id', to: 'tasks#show'           # url after cliking link - http://localhost:3000/tasks.id
end
