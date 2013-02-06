Nodalpoint::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => "logout"
  match "/login" => "sessions#index", :as => "login"

  match "/typeahead/brand" => "users#users_brands", :as => "brand_typeahead"

  resources :cameras
  resources :lenses
  resources :nodal_points

  resources :users

  root :to => 'nodal_points#index'
end
