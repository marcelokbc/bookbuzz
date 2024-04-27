Rails.application.routes.draw do
  devise_for :users
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
