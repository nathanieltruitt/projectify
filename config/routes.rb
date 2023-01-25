Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :project
  resources :comment
  resources :contact
  resources :phase
  resources :project_type
  resources :status
  resources :task

  namespace :admin do
    resources :user
    resources :permission
    resources :organization
  end
end
