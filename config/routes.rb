Rails.application.routes.draw do
  devise_for :companies, path: 'companies', controllers: {
    sessions: 'companies/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'
  resources :user_profiles, only: [:show, :new, :create]
  resources :user_studies, only: [:new, :create]

end
