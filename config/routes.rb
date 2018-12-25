Rails.application.routes.draw do
  devise_for :companies, path: 'companies', controllers: {
    sessions: 'companies/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
