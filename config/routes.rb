Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :shops, except: [:new, :create, :destroy] do
      get "search", on: :collection
    end
  end
  
  
  devise_for :shops, skip: [:passwords], controllers:{
    registrations: "shop/registrations",
    sessions: "shop/sessions"
  }
  
  devise_scope :shop do
    get "/shops/sign_out" => "devise/sessions#destroy"
  end
  
  scope module: :shop do
    root "homes#top"
    get "/about" => "homes#about"
    get "/shops/my_page" => "shops#show"
    get "/shops/information/edit" => "shops#edit"
    patch "/shops/information" => "shops#update"
    get "/shops/confirm_withdraw" => "shops#confirm_withdraw"
    patch "/shops/withdraw" => "shops#withdraw"

    
    resources :items
    
    #resources :resercation_details
    
    #resources :notification
    
    resources :to_gos
    get "/history" => "to_gos#history"
    get "/history/show/:id" => "to_gos#history_show", as: :history_show
    get "/search", to: "to_gos#search"
    get "/history/search", to: "to_gos#history_search"
    patch "/change_status/:id" => "to_gos#change_status", as: :change_status
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
