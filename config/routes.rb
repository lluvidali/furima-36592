Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items

  root to: 'orders#index'
  resources :orders, only:[:create]

  root to: 'buy_infos#index'
  resources :buy_infos, only:[:create]
end
