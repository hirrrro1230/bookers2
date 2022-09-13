Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'top' => 'homes#top', as: '/'
  get 'home/about' => 'homes#about', as: 'home_about'
  resources :books
  post 'books/:id/edit' => 'books#edit'
  resources :users, only: [:show, :edit, :index, :update]
end
