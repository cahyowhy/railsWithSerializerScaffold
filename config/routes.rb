Rails.application.routes.draw do
  resources :imagelikes
  resources :imagecomments
  resources :imagepaths
  resources :imageposts
  resources :users
  resources :tasks

  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
