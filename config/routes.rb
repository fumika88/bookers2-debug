Rails.application.routes.draw do
  get 'search/search'

  devise_for :users
  root :to => 'homes#top'
  get 'home/about' => 'homes#about'


  resources :books, only: [:new, :create, :edit, :index, :show, :destroy] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  get '/search', to: 'search#search'
  end
  resources :users, only: [:show,:index,:edit,:update] do
  resource :relationships, only: [:create, :destroy]
  get '/search', to: 'search#search'
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end

end