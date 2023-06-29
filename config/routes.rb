Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update]
  end 

  get '/shopping_list/:id', to: 'users#shopping_list', as: 'shopping_list'
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_list', to: 'recipes#general_shopping_list'


end
