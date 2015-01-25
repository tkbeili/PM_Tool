Rails.application.routes.draw do

  # get 'tasks/index'
  # get 'tasks/new'
  # get 'tasks/create'
  # get 'tasks/show'
  # get 'tasks/edit'
  # get 'tasks/update'
  # get 'tasks/destroy'

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
  resources :projects do
    resources :discussions, only: [:create, :destroy]
  end
  
  resources :tasks

end
