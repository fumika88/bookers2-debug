Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only: [:new, :create, :edit, :index, :show, :destroy] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show,:index,:edit,:update]
end