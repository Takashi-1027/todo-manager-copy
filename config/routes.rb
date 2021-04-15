Rails.application.routes.draw do
  # devise_for :users <- ゲストユーザーが未実装の時のコード
  
# ゲストとログイン機能実装
#   devise_for :users, controllers: {
#     registrations: 'users/registrations'
#   }
# を次に置き換える。（,の付け忘れに注意！）
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }


  # post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
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
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html