Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controllers#method'

  # sets root page to be the tasks view
  root to: 'tasks#index'

  # CREATE - forms page for new tasks
  # get 'tasks/new' route needs to be before 'tasks#show' route, otherwise 'tasks/new' will be treated as an id
  get 'tasks/new', to: 'tasks#new'
  # CREATE - post forms page data
  post 'tasks', to: 'tasks#create'

  # READ - index of all task
  get 'tasks', to: 'tasks#index'
  # READ - show on task
  get 'tasks/:id', to: 'tasks#show', as: :task  # url after cliking link - http://localhost:3000/tasks/id
  # get 'tasks/:id', to: 'tasks#show'           # url after cliking link - http://localhost:3000/tasks.id

  # Update a restaurant
  # get '/restaurants/:id/edit', to: 'restaurants#edit', as: 'restaurants_edit'
  # patch '/restaurants/:id', to: 'restaurants#update'
  # # Destroy a restaurant
  # delete '/restaurants/:id', to: 'restaurants#destroy'


  # UPDATE - forms page for existing tasks
  # as: 'restaurants_edit' could be as: 'whatever'
  # as: 'restaurants_edit' is needed for link paths
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'tasks_edit'
  # UPDATE - patch forms page data
  patch 'tasks/:id', to: 'tasks#update'

  # DELETE
  delete 'tasks/:id', to: 'tasks#destroy'

  # replaces all of the above
  # resources :tasks
end
