Rails.application.routes.draw do
  root 'task_manager#index'
  post 'task_manager/create_list' => 'task_manager#create_list'
  get 'task_manager/:id' => 'task_manager#list'
  post 'task_manager/create_task/:id' => 'task_manager#create_task'
  delete 'task_manager/delete_list/:list' => 'task_manager#delete_list'
  delete 'task_manager/delete_task/:list&:id' => 'task_manager#delete_task'
end
