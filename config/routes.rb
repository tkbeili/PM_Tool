Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'registrations'}
  get "home/about" => "home#about"
  root "home#index"

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  resources :favourites, only: [:index]

  resources :projects do
    resources :discussions
    resources :tasks
    resources :favourites, only: [:create, :destroy]
  end

  resources :discussions do
    resources :comments
  end
   
end
