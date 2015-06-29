Rails.application.routes.draw do
  resources :recalls
  resources :sessions,  only: [:new,  :create,  :destroy]

  resources :users

  resources :users do
    resources :posts
  end  

  get 'pages/lang_toggle/:locale' => 'pages#lang_toggle', :as => :pages_lang_toggle
  get 'pages/home'
  get 'pages/all_diary'
  get 'pages/popular_diary'
  get 'pages/lasts_diary'
  get 'pages/rules'
  get 'pages/confidencial_politics'
  get 'pages/popular_posts'
  get 'pages/last_posts'
  get 'pages/my_last_posts'

  # match '/users', to: 'users#index', via:  'get'
  match '/signup', to: 'users#new', via:  'get'
  match '/signin', to: 'sessions#new', via:  'get'
  match '/signout', to: 'sessions#destroy', via:  'delete'  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  namespace :admin do
    resources :users
    get "admin" => 'users#index'
  end  

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
