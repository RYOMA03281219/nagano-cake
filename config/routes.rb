Rails.application.routes.draw do
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



# 管理者側のルーティング設定
# 管理者用
# URL /admin/sign_in ...




end
  #   # devise_for :admins, skip: :all
  #   # devise_scope :admins do
  #   # get '/sign_in' => 'sessions#new'
  #   # post '/sign_in' => 'sessions#create'
  #   # delete '/sign_out' => 'sessions#destroy'
