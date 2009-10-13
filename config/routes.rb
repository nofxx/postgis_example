ActionController::Routing::Routes.draw do |map|
  # Root home controller
  map.root :controller => 'home', :action => 'index'

  map.resources :regions
  map.resources :paths
  map.resources :marks
end
