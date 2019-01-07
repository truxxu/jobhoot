Rails.application.routes.draw do
  get 'work_preferences/new'
  get 'user_languages/new'
  get 'user_other_studies/new'
  get 'user_other_studies/create'
  devise_for :companies, path: 'companies', controllers: {
    sessions: 'companies/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'
  resources :user_profiles, only: [:show, :new, :create]
  resources :user_studies, only: [:new, :create]
  resources :user_other_studies, only: [:new, :create]
  resources :user_languages, only: [:new, :create]
  resources :work_preferences, only: [:new, :create]
  resources :user_skills, only: [:new, :create]
  resources :user_experiences, only: [:new, :create]

end
