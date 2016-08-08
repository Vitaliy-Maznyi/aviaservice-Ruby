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

  # do
  #   resources :flights, controller: 'companies/flights'
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'flights#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
