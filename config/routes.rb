Rails.application.routes.draw do
  root "products#index"
  resources :products, only: [:index, :new, :create] do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: 'cart/items'

get '/cart/checkout', to: 'orders#new', as: :checkout
patch '/cart/checkout', to: 'orders#create'

end

