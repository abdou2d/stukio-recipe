Rails.application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }
  
  resources :courses do
  	resources :chapters
  end

  resources :subscriptions

  resources :schools

  get  "/my_current_user" => "users#my_current_user"

  get "/subscribers" => "users#subscribers"

  get "/all_users" => "users#all_users"

  match 'users/:id' => 'users#update_user', via: [:patch]





end