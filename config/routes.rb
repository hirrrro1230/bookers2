Rails.application.routes.draw do
  devise_for :users
  root to: "homes#about"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update]
  post 'books/:id/edit' => 'books#edit'
  resources :users, only: [:show, :edit, :index]
end
