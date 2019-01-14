Rails.application.routes.draw do
  devise_for :companies, path: 'companies', controllers: {
    sessions: 'companies/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'
  get 'pages/applicant_welcome', as: 'applicant_welcome'
  resources :user_profiles, only: [:show, :new, :create, :edit, :update]
  resources :user_studies, only: [:new, :create, :destroy, :edit, :update]
  resources :user_other_studies, only: [:new, :create, :destroy, :edit, :update]
  resources :user_languages, only: [:new, :create, :destroy, :edit, :update]
  resources :work_preferences, only: [:new, :create, :destroy, :edit, :update]
  resources :user_skills, only: [:new, :create, :destroy]
  resources :user_experiences, only: [:new, :create, :destroy, :edit, :update]
  resources :user_traits, only: [:new, :create, :destroy]
  resources :user_hobbies, only: [:new, :create, :destroy, :edit, :update]

end
