Rails.application.routes.draw do
  # devise_for :users <- ゲストユーザーが未実装の時のコード

  # ゲストとログイン機能実装
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root :to => "homes#index"
  get 'home/about' => 'homes#about'
  resources :routine_tasks
  resources :users
  resources :tasks do
    put :sort
  end

  #タスクに付けるラベルの検索に使用している。
  resources :labels do
    get 'tasks', to: 'tasks#search'
  end

  # タスクの検索に使用している。
  get 'seek', to: 'seeks#seek'

  # resources :notifications, only: [:index, :show, :destroy, :destroy_all]
  # delete 'notifications/destroy_all' , to: 'notifications#destroy_all'

  resources :notifications do
    delete 'destroy_all'
  end

  # 楽天APIでの書籍検索に利用している。
  get 'books/search'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html