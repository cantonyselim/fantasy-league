Footbawwl::Application.routes.draw do
  
  get "game_week/get_total_team_points"
  get "game_week/get_gw_team_points"
  get "game_week/get_gw_roster"
  get "game_week/get_gw_player_points"
  get "match_player/rushing"
  get "match_player/passing"
  get "match_player/defense"
  get "match_player/kicker"
  get "match_player/show"
 # All the routes for user  get "user/create"
  get "user/update"
  get "user/show" => "user#show", as: :showalluser
  get "user/show/:id" => "user#show", as: :showuser
  
  #posts
  post "user/create" => "user#create", as: :newuser
  post "user/delete" => "user#delete", as: :deleteuser
  post "user/update" => "user#update", as: :updateuser
  
  # All the routes for nfl player
  get "nfl_player/unpicked"
  get "nfl_player/show/:id" => "nfl_player#show", as: :showplayer
  
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
