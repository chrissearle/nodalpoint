Nodalpoint::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => "logout"
  match "/login" => "sessions#index", :as => "login"

  resources :cameras
  resources :lenses
  resources :nodal_points

  resources :users

  root :to => 'nodal_points#index'
end
