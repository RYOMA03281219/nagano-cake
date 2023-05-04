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
  # patch '/customers/information' => 'customers#update'
  get '/customers/cancellation' => 'customers#cancellation'
  # patch '/customers/withdrawal' => 'customers#withdrawal'
  # resources :customers, only: [:show, :edit, :update, :cancellation, :withdrawal]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :orders, only: [:new, :confirm, :completion, :create, :index, :show]
  resources :addresses, only: [:index, :edit]
 end


# 管理者側のルーティング設定
# 管理者用
# URL /admin/sign_in ...




end
  #   # devise_for :admins, skip: :all
  #   # devise_scope :admins do
  #   # get '/sign_in' => 'sessions#new'
  #   # post '/sign_in' => 'sessions#create'
  #   # delete '/sign_out' => 'sessions#destroy'
