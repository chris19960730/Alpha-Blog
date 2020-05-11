Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles
  get "signup", to: "users#new"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :categories, except: [:destroy]

  get "articles/:id/comments/new", to: "comments#new", as: "new_comment"
  post "articles/:id/comments", to: "comments#create", as: "comments"
  #resources :comments, only: [:new, :create, :destroy]
  # , only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
