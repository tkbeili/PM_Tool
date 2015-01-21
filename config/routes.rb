Rails.application.routes.draw do

  # get 'projects/index'
  # get 'projects/create'
  # get 'projects/new'
  # get 'projects/edit'
  # get 'projects/show'
  # get 'projects/update'
  # get 'projects/destroy'

  
  get "home/about" => "home#about"
  # get "/about" => "home#about" # Is this right?
  root "home#index"
  # resources :home # is this necessary?
  resources :projects

end
