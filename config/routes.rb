Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index ,:show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
  end
end

namespace :api do
  namespace :v1 do
    resources :users do
end
end 
end
end




































































