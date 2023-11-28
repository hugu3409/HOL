Rails.application.routes.draw do
  resources :attendances
  resources :students
  resources :situations
  resources :classrooms
  resources :teachers
  resources :select
  get 'login/show', to: 'login#show'
  post 'login/login', to: 'login#login'
  get 'select/show', to: 'select#show'
  get 'attendance_list/:classroom_id', to: 'attendance_list#show', as: 'attendance_list_show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
