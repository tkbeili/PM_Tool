Rails.application.routes.draw do
  
  get "home/about" => "home#about"
  # get "/about" => "home#about" # Is this right?
  root "home#index"
  # resources :home # is this necessary?
  resources :projects do
    resources :discussions
  end
  
  resources :tasks

end
