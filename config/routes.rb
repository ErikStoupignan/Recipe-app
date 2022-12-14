Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'public_recipes#index'
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :public_recipes, only: [:index]
  resources :recipe_foods, only: [:new, :create, :destroy]

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
  end

  resources :foods, only: [:new, :create, :destroy] do
  end
end
