Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
  end
  resources :all_users_chats, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy, :new]
  end
end