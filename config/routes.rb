Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :reviews, :rides, :ride_offers
  
  devise_scope :user do
  	root :to => 'devise/registrations#new'
  end
  
  %w(about help faq).each do |name|
    get "/#{name}",     to: "pages##{name}"
  end
  
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # You can have the root of your site routed with "root"
end
