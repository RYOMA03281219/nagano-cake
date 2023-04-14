Rails.application.routes.draw do
   # 会員側のルーティング設定
  devise_for :public
  get "/home/about" => "homes#about"
  get 'items' => 'public/items#index'


  # 管理者側のルーティング設定
  devise_for :admin
  namespace :admin do
  root to: 'homes#top'
  resources :customers, only: [:edit, :index, :show, :update]

    get 'items' => 'admin/items#index'
  end
end
