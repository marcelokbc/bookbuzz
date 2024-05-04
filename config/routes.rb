Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :books 
    resources :comments, only: [:index, :show]
    resources :users
    resources :dashboard, only: [:index]

    root to: 'dashboard#index'
  end

  resources :books, only: %i[index, show] do
    resources :comments, only: [:create, :edit, :update, :destroy] do
      member do
        post :like
        post :dislike
      end
    end
  end
  root 'books#index'
end
