Rails.application.routes.draw do  
  
  root 'pets#index'

  get 'mascotas/buscar' => 'pets#search', as: :search_pet

  get 'usuario/mis_mascotas' => 'pets#my_pets', as: :my_pets_pet
  get 'mascotas/:id/interesados' => 'pets#list_interested', as: :list_interested_pet
  get 'usuario/nuevo_dueño' => 'pets#new_owner', as: :new_owner_pet
  get 'mascota/:id/solicitud' => 'pets#show_request', as: :show_request_pet
  #post 'solicitud/nueva' => 'solicituds#new', as: :new_solicitud
  post 'distancia' => 'pets#show_distance', as: :distance

  resources :solicituds,
    path: 'solicitud',
    path_names: { new:'nueva', edit: "editar", create:'nueva'}

  resources :pets,
    path: 'mascotas',
    path_names: { new: "nueva", edit: "editar"}


  devise_for :users,
    controllers: { sessions: "users/sessions", registrations: 'users/registrations',
                   confirmations: "users/confirmations", passwords: 'users/passwords',
                   omniauth_callbacks: 'omniauth_callbacks'}, 
    path: "/", 
    path_names: { sign_in: 'ingresar', password: 'contraseña', sign_out: 'salir',
                  registration: 'registrarme', sign_up: '/', confirmation: 'confirmacion'}

  devise_scope :user do
    get 'dislike' => 'pets#notInterested', as: :desinteresado
    get 'like' => 'pets#interested', as: :interesado
    get 'contraseña/nueva' => 'users/passwords#new',  as: :new_password
    post 'contraseña/nueva' => 'users/passwords#create', as: :password
    get 'contraseña/editar' => 'users/passwords#edit', as: :edit_password
    match 'contraseña/editar' => 'users/passwords#update', via: [:put, :patch], as: :update_password
    get 'usuario/editar' => 'users/registrations#edit', as: :edit_user
    match 'usuario/editar' => 'users/registrations#update', via: [:put, :patch], as: :update_user
    get 'usuario/' => 'user#index', as: :user
    get 'confirmacion' => 'users/confirmations#new', as: :new_confirmation
  end
    
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
