Rails.application.routes.draw do
  # 管理者側のルーティング設定
  devise_for :admins
  namespace :admin do
  root to: 'sessions#new'

  resources :customers, only: [:edit, :index, :show, :update]

    get 'items' => 'admin/items#index'
  end
end
