Rails.application.routes.draw do
  concern :days_ago_index do
    get 'days/:days', action: 'days_index', on: :collection
  end

  root "pools#index"
  resources :cierres
  resources :payment_cards
  resources :provincials, concerns: :days_ago_index
  resources :banescos, concerns: :days_ago_index
  resources :mercantils, concerns: :days_ago_index
  resources :bods, concerns: :days_ago_index
  resources :bdvs, concerns: :days_ago_index
  resources :pools, concerns: :days_ago_index
  resources :auth_groups
  resources :employee_groups
  resources :employees
  resources :retenciones
  resources :inversions
  resources :ggs
  resources :deducciones_odts
  resources :comision_odts
  resources :odts
  resources :razon_socials

  devise_for :users, :controllers => { registrations: 'registrations' }

  get '/approve/:token', to: 'permission_request#approve'
  get '/deny/:token', to: 'permission_request#deny'
  get '/ask', to: 'permission_request#ask', as: :ask_permission
  post '/set_permission', to: 'permission_request#set_permission'

  
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
