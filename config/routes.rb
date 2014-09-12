JacksonArch::Application.routes.draw do

  resources :looking_for_jobs

  resources :skills

  resources :educations

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

  get 'my_profile', to: 'users#show'

  resources :users do
    resources :jobs
    get 'location', to: 'locations#show'
    resource :user_profile, :only => [:edit, :update, :show]
    resources :locations, :only => [:show, :update, :edit]
  end

  devise_for :user, path: "/registrations", :controllers => {:registrations => "registrations"}


end