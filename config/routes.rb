Rails.application.routes.draw do
  
root to: 'customer/homes#top'
get "customer/home/about"=>"customer#homes#about"


namespace :customer do
resources :products, only: [:index, :show]
get "current_customer/unsubscribe"=>"current_customers#unsubscribe"
get "current_customer/withdrawal"=>"current_customers#withdrawal"
resources :current_customer, only: [:show, :edit, :update] 
get "shopping_carts/all_destroy"=>"shopping_carts#all_destroy"
resources :shopping_carts, only: [:index, :update, :destroy, :create]
resources :orders, only: [:new, :confilm, :complete, :create, :index, :show]
resources :delivery_addressees, only: [:index, :edit, :create, :update, :destroy]
end


get "master/home/top"=>"master#homes#top"

namespace :master do
root to: 'homes#top'
resources :homes, only: [:top]
resources :products, only: [:index, :new, :create, :show, :edit, :update]
resources :genres, only: [:index, :create, :edit, :update]
resources :users, only: [:index, :show, :edit, :update]
resources :orders, only: [:show, :update]
resources :orders_datails, only: [:update]
end
  
  
  
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :master, skip: [:registrations, :passwords] ,controllers: {
  sessions: "master/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
