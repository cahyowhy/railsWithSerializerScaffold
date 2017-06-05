Rails.application.routes.draw do
  resources :imagelikes
  resources :imagecomments
  resources :imagepaths
  resources :imageposts
  resources :users
  resources :tasks

  get 'imagelikes/post/:id', to: 'imagelikes#show_by_imagepost'
  get 'imagecomments/post/:id', to: 'imagecomments#show_by_imagepost'
  get 'imagepaths/post/:id', to: 'imagepaths#show_by_imagepost'
  get 'imageposts/offset/:offset/limit/:limit', to:'imageposts#show_limit_offset'
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
