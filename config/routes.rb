Rails.application.routes.draw do

  get "home/about" => "home#about"
  root "home#index"
  resources :home

end
