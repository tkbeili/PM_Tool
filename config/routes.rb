Rails.application.routes.draw do
  
  devise_for :users
  get "home/about" => "home#about"
  # get "/about" => "home#about" # Is this right?
  root "home#index"
  # resources :home # is this necessary?
  # patch "projects/:project_id/discussions" => "discussions#update"

  resources :projects do
    resources :discussions
    resources :tasks
  end

  resources :discussions do
    resources :comments
  end
   
  # resources :tasks

end
