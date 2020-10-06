Rails.application.routes.draw do

  devise_for :users
  root 'home#top'
  get 'home/about' => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  resources :books, only: [:new, :create, :index, :show] do
  	resources :book_comments, only: [:create, :destroy]
  end
   resources :books, only: [:new, :create, :index, :show] do
  	resources :favorites, only: [:create, :destroy]
  end
end
