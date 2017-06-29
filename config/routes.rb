Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'static_pages#home'
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :categories
  resources :sub_categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
