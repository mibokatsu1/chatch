Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
  end
  resources :all_users_chats do
    resources :comments, only: [:create, :destroy, :new]
    collection do
      get 'search'
    end
  end
  resources :tags do
    get 'all_users_chats', to: 'all_users_chats#search'
  end
end