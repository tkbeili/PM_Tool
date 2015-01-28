Rails.application.routes.draw do
  
  get "home/about" => "home#about"
  # get "/about" => "home#about" # Is this right?
  root "home#index"
  # resources :home # is this necessary?
  # patch "projects/:project_id/discussions" => "discussions#update"

  resources :projects do
    resources :discussions
  end

  resources :discussions do
    resources :comments
  end
   
  resources :tasks

end
