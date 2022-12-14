Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'users#index'
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end

  resources :users, only: [:index, :show] do
  end
end
