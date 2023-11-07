Rails.application.routes.draw do
  resources :attendances
  resources :students
  resources :situations
  resources :classrooms
  resources :teachers
  get 'login/show', to: 'login#show'
  post 'login/login', to: 'login#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
