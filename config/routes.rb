Rails.application.routes.draw do
  root :to => "homes#top"
  get 'home/about' => 'homes#about'
  resources :users
  resources :tasks
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html