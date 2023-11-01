Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
# 顧客用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
  get '/' => 'homes#top'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :customers, only: [:edit, :index, :show, :update]
  resources :orders, only: [:show]
  resources :genres, only: [:index, :create, :edit, :update]
  end

# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
  root 'homes#top'
  get '/homes/about' => 'homes#about'
  resources :items, only: [:index, :show]
  get '/customers/my_page' => 'customers#show'
  get '/customers/information/edit' => 'customers#edit'
  patch '/customers/information' => 'customers#update'
  get '/customers/cancellation' => 'customers#cancellation'
  patch '/customers/withdrawal' => 'customers#withdrawal'
  # resources :customers, only: [:show, :edit, :update, :cancellation, :withdrawal]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy, :create]
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/completion' => 'orders#completion'
  resources :orders, only: [:new, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
 end

end
