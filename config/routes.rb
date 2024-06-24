Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # Default routes
  resources :downloads
  resources :events
  resources :forms
  resources :news
  resources :videos

  # Devise routes
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get 'home/index'
  root to: "home#index"

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :downloads, only: [:index]
      resources :events, only: [:index, :show]
      resources :news, only: [:index, :show]
      resources :videos, only: [:index]
      resources :register_phones, only: [:create]
      resources :app_status, only: [:index]
      resources :forms, only: [:create]
      get "get_help_text", to: 'forms#get_help_text'
    end

    namespace :v2 do
      resources :news, only: [:index, :show]
    end
  end
end
