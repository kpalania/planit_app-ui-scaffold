Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :profiles

  root to: 'home#index'
end
