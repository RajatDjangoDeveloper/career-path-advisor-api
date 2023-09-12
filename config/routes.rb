# Rails.application.routes.draw do
#   devise_for :users
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :profiles
  resources :assessments

  resources :users do
    resources :assessments
  end

  resources :users do
      resources :profiles
  end

  resources :users do
    resources :job_search #, only: [:index, :show]
  end

  # resources :job_search, only: [:index, :show] do
  #   get :search, on: :collection
  # end

end