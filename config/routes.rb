Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'type', to: 'bookings#type', as: 'type'
  get 'ski_instructors', to: 'instructors#ski_instructors',
                         as: 'ski_instructors'
  get 'snb_instructors', to: 'instructors#snb_instructors',
                         as: 'snb_instructors'
  get 'kontakt', to: 'general#kontakt', as: 'kontakt'
  get 'cennik', to: 'general#cennik', as: 'cennik'

  resources :users, only: [:create, :index, :new] do
    resources :bookings
  end
  resources :sessions, only: [:create, :new]
  resources :ratings, only: [:create, :index, :new, :show] do
    resources :rcomments, only: [:create, :new]
  end
  resources :skinews, only: [:index, :show]
  resources :instructors, only: [:index, :show] do
    resources :bookings
    member do
      get :reserved
    end
  end

  namespace :admin do
    resources :users do
      resources :bookings
    end
  end

  root 'users#index'
end
