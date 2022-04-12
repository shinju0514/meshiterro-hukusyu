Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :post_images, only:[:index, :show, :new, :create, :destroy] do
    resource :favorites, only:[:create, :destroy]
    resources :post_comments, only:[:create, :destroy]
  end
  resources :users, only:[:edit, :show, :update]
  get 'homes/about' => 'homes#about', as: 'about'
end
