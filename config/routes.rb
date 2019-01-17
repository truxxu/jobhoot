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
  resources :user_studies, only: [:show, :new, :create, :destroy, :edit, :update]
  resources :user_other_studies, only: [:show, :new, :create, :destroy, :edit, :update]
  resources :user_languages, only: [:show, :new, :create, :destroy, :edit, :update]
  resources :work_preferences, only: [:show, :new, :create, :destroy, :edit, :update]
  resources :user_skills, only: [:show, :new, :create, :destroy]
  resources :user_experiences, only: [:show, :new, :create, :destroy, :edit, :update]
  resources :user_traits, only: [:show, :new, :create, :destroy]
  resources :user_hobbies, only: [:show, :new, :create, :destroy, :edit, :update]

end
