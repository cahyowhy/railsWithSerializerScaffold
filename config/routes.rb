Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  resources :imagelikes, only: [:create, :destroy, :show_by_imagepost]
  resources :imagecomments, only: [:create, :destroy, :show_by_imagepost, :update]
  resources :imagepaths
  resources :imageposts do
    collection do
      get :photo_timelines
    end
  end
  resources :users do
    member do
      get :following, :followers
    end
  end

  get 'imagelikes/post/:id', to: 'imagelikes#show_by_imagepost'
  get 'imagecomments/post/:id', to: 'imagecomments#show_by_imagepost'
  get 'imagepaths/post/:id', to: 'imagepaths#show_by_imagepost'
  get 'imageposts/offset/:offset/limit/:limit', to: 'imageposts#show_limit_offset'
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # https://www.railstutorial.org/book/following_users
end
