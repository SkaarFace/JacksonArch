JacksonArch::Application.routes.draw do

  root :to => "home#index"


  resources :clients do
    resources :jobs, :controller => "clients/jobs"
    resources :client_locations
  end

  namespace :admin do
    resources :contracts
    resources :job_types
    resources :job_categories
    resources :jobs
    resources :locations
  end

  resources :contracts

  resources :job_types

  resources :job_categories

  resources :jobs

  resources :locations

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    resources :jobs
    get 'location', to: 'locations#show'
    resource :user_profile, :only => [:edit, :update, :show]
    resources :locations, :only => [:show, :update, :edit]
  end

  resource :user_profile, :only => [:edit, :update, :show]

end