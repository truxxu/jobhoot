Rails.application.routes.draw do
  devise_for :companies, path: 'companies', controllers: {
    sessions: 'companies/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'
  resources :user_profiles, only: [:show, :new, :create]
  resources :user_studies, only: [:new, :create, :destroy]
  resources :user_other_studies, only: [:new, :create]
  resources :user_languages, only: [:new, :create]
  resources :work_preferences, only: [:new, :create]
  resources :user_skills, only: [:new, :create]
  resources :user_experiences, only: [:new, :create]
  resources :user_traits, only: [:new, :create]
  resources :user_hobbies, only: [:new, :create]

end
