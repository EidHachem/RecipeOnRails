Rails.application.routes.draw do
  get 'shopping_list/index'
  get 'shopping_list/show'
  devise_for :users
  get 'recipes/index', to: 'recipes#public'
  resources :users do
    resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :shopping_list, only: [:index ,:show]
    end
  end
  resources :users do
    resources :foods
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#public"
end
