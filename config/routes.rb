JacksonArch::Application.routes.draw do
  resources :clients

  resources :contracts

  resources :job_types

  resources :job_categories

  resources :jobs

  resources :locations

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end