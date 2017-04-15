Rails.application.routes.draw do

  concern :get_modal do
    get 'modal/:id/:button/:form', action: 'modal', as: 'modal', on: :collection
  end
  
  resources :payment_methods
  resources :accounts
  resources :cierres
  resources :auth_groups
  resources :employees, concerns: :get_modal
  resources :retenciones
  resources :inversions, concerns: :get_modal
  resources :ggs, concerns: :get_modal
  resources :deducciones_odts
  resources :comision_odts
  resources :odts, concerns: :get_modal
  resources :razon_socials, concerns: :get_modal
  resources :pools, concerns: :get_modal do
    get 'account/:id', action: 'account_index', as: 'account', on: :collection
    get 'account/:id/days/:days', action: 'days_index', as: 'days_account', on: :collection
  end
  root "pools#days_index", :id => 1, :days => 0

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
