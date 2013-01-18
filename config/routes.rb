Adelante::Application.routes.draw do
  root to: 'home#home'

  match '/therapies/autocomplete', to: 'therapies#autocomplete', via: :get
  match '/search/suggestions', to: 'search#suggestions', via: :get
  match '/exercises/existing_suggestions', to: 'exercises#existing_suggestions', via: :get, as: :show_existing_suggestions
  match '/therapies/show_suggestions', to: 'therapies#show_suggestions', via: :get, as: :show_therapy_suggestions
  match 'clients/new_session/(:id)', to: 'clients#new_session', as: :create_new_session


  resources :sessions, only: [:new, :create, :destroy]
  resources :clientsessions do
     member do
      get 'edit_individual'
      put 'update_individual'
    end
  end
  resources :therapies_exercises, only: [:new, :create, :destroy]
  resources :colleagues_shares
  resources :agenda
  resources :therapists
  resources :therapies
  resources :exercises
  resources :agenda
  resources :clients do
    resources :clientsessions, only: [:index] do
      resources :therapies, only: [:index] do
        resources :exercises, only: [:index]
      end

    end
  end

  resources :colleagues

  match '/saved_therapies/create/(:id)', to: 'saved_therapies#create', via: :get, as: :create_saved_therapies
  match '/saved_therapies/delete/(:id)', to: 'saved_therapies#delete', via: :get, as: :delete_saved_therapies

  match '/exercises/add_existing/(:id)', to: 'exercises#add_existing', via: :get, as: :add_existing_exercises
  match '/exercises/new_or_existing_question/(:id)', to: 'exercises#new_or_existing_question', via: :get, as: :new_or_existing_question
  match '/exercises/new_question/(:id)', to: 'exercises#new_question', via: :get, as: :new_exercise_question
  match '/exercises/position/(:id)', to: 'exercises#position', via: :get, as: :exercise_position

  match '/exercises/update_order', to: 'exercises#update_order', via: :post

  match '/home',  to: 'home#home'
  #match '/clients',  to: 'client#index'
  #match '/client/:id',  to: 'client#show'
  match '/signin',  to: 'sessions#index'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/client/ajax_show/(:id)', to: 'client#ajax_show', via: :get

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
