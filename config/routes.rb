Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  resources :imagelikes, only: [:create, :destroy, :show_by_imagepost]
  resources :imagecomments, only: [:create, :destroy, :show_by_imagepost, :update]
  resources :imagepaths
  resources :imageposts
  resources :users do
    member do
      get :following, :followers
    end
  end

  get 'timelines/offset/:offset/limit/:limit', to: 'imageposts#photo_timelines'
  get 'imagelikes/post/:id', to: 'imagelikes#show_by_imagepost'
  get 'imagecomments/post/:id', to: 'imagecomments#show_by_imagepost'
  get 'imagepaths/post/:id', to: 'imagepaths#show_by_imagepost'
  post 'authenticate', to: 'authentication#authenticate'
end
