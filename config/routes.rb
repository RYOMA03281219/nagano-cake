Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}



# 管理者側のルーティング設定
# 管理者用
# URL /admin/sign_in ...
devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admins do
    devise_for :admins, skip: :all
    devise_scope :admins do
    get '/sign_in' => 'sessions#new'
    post '/sign_in' => 'sessions#create'
    delete '/sign_out' => 'sessions#destroy'
  end

  get '/admins' => 'homes#top'
  resources :customers, only: [:edit, :index, :show, :update]


  end
end
