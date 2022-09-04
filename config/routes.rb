Rails.application.routes.draw do
  devise_for :users
  root to: "homes#about"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :books
  post 'books/:id/edit' => 'books#edit'
  resources :users, only: [:show, :edit, :index]
end
