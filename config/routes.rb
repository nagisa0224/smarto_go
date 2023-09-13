Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get "top" => "homes#top"
    
    resources :shop, except: [:new, :create, :destoroy]
    
  end
  
  
  devise_for :shops, controllers: {
    registrations: "shop/registrations",
    sessions: "shop/sessions"
  }
  
  devise_scope :shop do
    get '/shops/sign_out' => 'devise/sessions#destroy'
  end
  
  scope module: :shop do
    root "homes#top"
    get "/about" => "homes#about"
    get "/shops/my_page" => "shops#show"
    get "/shops/information/edit" => "shops#edit"
    patch "/shops/information" => "shops#update"
    get "/shops/confirm_withdraw" => "shops#confirm_withdraw"
    patch "/shops/withdraw" => "shops#withdraw"
    get "names/search", to: "names#search"

    
    resources :items
    
    #resources :resercation_details, only: [:new, :create, :index, :show]
    
    #resources :notification
    
    resources :to_gos
    get "/history" => "to_gos#history"
    get "/history/show/:id" => "to_gos#history_show", as: :history_show
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
