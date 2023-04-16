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
  namespace :admin do
  get '' => 'homes#top'
  resources :customers, only: [:edit, :index, :show, :update]


  end
end
