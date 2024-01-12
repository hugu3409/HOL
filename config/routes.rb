Rails.application.routes.draw do
  resources :attendances
  resources :students
  resources :situations
  resources :classrooms
  resources :teachers
  resources :select
  root :to => 'login#show'
  get 'login/show', to: 'login#show'
  post 'login/login', to: 'login#login', as: 'login'
  get 'select/show', to: 'select#show'
  get    'attendance_list/edit/:base_date/:student_id', to: 'attendance_list#edit', as: 'attendance_list_edit'
  post   'attendance_list', to: 'attendance_list#create', as: 'attendance_list_create'
  patch  'attendance_list', to: 'attendance_list#update', as: 'attendance_list_update'
  delete 'attendance_list/:id', to: 'attendance_list#delete', as: 'attendance_list_delete'
  get 'attendance_list/:classroom_id', to: 'attendance_list#show', as: 'attendance_list_show'
  get 'print/:base_date/:classroom_id', to: 'print#show', as: 'print_show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
