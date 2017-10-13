Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "kuaishou#user_list"
  get "user/:id", to: "kuaishou#user"
  get "user/:id/refresh", to: "kuaishou#user_refresh"
  get "user_add/:id", to: "kuaishou#user_add"
  get "user_add", to: "kuaishou#user_add"
  get "/photo/:id/set_ad", to: "kuaishou#set_ad"
  get "ads", to: "kuaishou#ads"

  get "meipai/user/:id", to: "meipai#user"
  get "meipai/user/:id/refresh", to: "meipai#user_refresh"
  get "meipai/user_add/:id", to: "meipai#user_add"
  get "meipai/user_add", to: "meipai#user_add"
  get "meipai/photo/:id/set_ad", to: "meipai#set_ad"
  get "meipai/ads", to: "meipai#ads"
end
