Rails.application.routes.draw do
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  devise_for :users,skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins,skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  scope module: :public do
    resources :users, only:[:show, :edit, :update]
    resources :messages
    
    root to: 'homes#top'
  end
  
  namespace :admin do
    resources :users, only:[:index, :show, :update]
    resources :messages
    resources :tags
    
    root to: 'homes#top'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
