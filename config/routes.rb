# frozen_string_literal: true

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

  resources :users do
    resources :assesments
  end

  
  resources :users do
    resources :educations
  end

  resources :users do
    resources :job_searches, only: [:index]
  end

  resources :users do
    resources :career_advisors, only: [:index]
  end
end
