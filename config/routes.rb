# -*- encoding : utf-8 -*-
Weblog::Application.routes.draw do

  get "states/update"
  root to: 'web/welcome#index'
  get 't/:tag' => 'web/welcome#index', as: :stories_by_tag

  scope module: :web do
    resources :users, only: [:new, :create]
    resources :stories, only: [:new, :create, :show] do
      scope :module => :stories do
        resources :comments, only: [:create]
      end
    end
    resource :session, only: [:new, :create, :destroy]
    namespace :admin do
      root to: 'welcome#index'
      resources :stories, only: [:index, :show, :edit, :update, :destroy] do
        scope :module => :stories do
          resource :state, only: [:update]
        end
      end
      resources :hosts, only: [:index, :update] do
        scope :module => :hosts do
          resource :state, only: [:update]
        end
      end
    end
  end
  # scope module: :web do
  #   match 'welcome', to: 'welcome#index', via: :get
  #   resource :session, only: [:new, :create, :destroy]
  #   resources :dealers, only: [:index, :show, :new]
  #   resources :users, only: [:new, :create]
  #   namespace :admin do
  #     root to: 'users#index'
  #     resources :tags, only: [:index, :new, :create, :edit, :update, :destroy]
  #     resources :users, only: [:index, :edit, :update, :destroy]
  #     resources :dealers, only: [:index, :new, :create, :edit, :update, :destroy]
  #   end
  # end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
