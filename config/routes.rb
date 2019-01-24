Rails.application.routes.draw do
  devise_for :companies, path: 'companies', controllers: {
    sessions: 'companies/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'
  get 'pages/applicant_welcome', as: 'applicant_welcome'
  get 'pages/about_us', as: 'about_us'
  resources :user_profiles, only: [:show, :new, :create, :edit, :update] do
    resources :user_studies, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :user_other_studies, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :user_languages, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :work_preferences, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :user_skills, only: [:index, :new, :create, :destroy]
    resources :user_experiences, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :user_traits, only: [:index, :new, :create, :destroy]
    resources :user_hobbies, only: [:index, :new, :create, :destroy, :edit, :update]
  end

end
