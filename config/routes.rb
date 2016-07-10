Rails.application.routes.draw do


get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
#root :to => "users#new"
resources :users
resources :sessions
  get 'sessions/new'
  get 'users/new'
  resources :authors
  root 'article_topics#index'
   get 'news/find' => 'news#find'
   get 'news/typ' => 'news#typ'
  resources :news do
    get 'find', on: :member
  end
  resources :articles, :news, :bibliography_elements, :article_topics, :menu_items, :graphics
  resources :newsy, :controller => :news
  resources :bibliografia, :controller => :bibliography_elements
  resources :artykuly, :controller =>  :articles
  resources :neurowiedza, :controller => :article_topics
  resources :o_witrynie, :controller => :website
  get "neurowiedza" => 'article_topics#index'
  resources :article_topics do 
        resources :articles, :shallow => true
      end
 

  resources :menu_items, :as => "menu"

 
 
  
  

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
