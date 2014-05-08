JacksonArch::Application.routes.draw do
  resources :contract_types

  resources :job_types

  resources :job_categories

  resources :clients

  resources :jobs

  resources :locations

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end