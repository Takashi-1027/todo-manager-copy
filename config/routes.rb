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
  resources :tasks

  resources :labels do
    get 'tasks', to: 'tasks#search'
  end

  get 'seek' => 'seeks#seek'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html