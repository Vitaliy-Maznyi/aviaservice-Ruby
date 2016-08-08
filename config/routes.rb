Rails.application.routes.draw do

  devise_for :users

  get 'orders' => 'orders#index'

  resource :profile, only: [:show, :edit, :update], controller: 'users'

  resources :companies, only: [:new, :create]

  resources :flights, only: :index do
    resources :orders, only: [:new, :create]
  end

  namespace :company do
    root 'flights#index'
    resources :flights, except: :show
    resources :planes
    get 'orders' => 'orders#index'
  end

  namespace :admin do
    root 'companies#index'
    scope ":companyname", companyname: :companyname do
      resources :flights, except: :show
      resources :planes
      resources :orders, only: [:index, :destroy]
    end
  end

  root 'flights#index'

end
