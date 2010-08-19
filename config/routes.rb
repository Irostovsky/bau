ActionController::Routing::Routes.draw do |map|
  
  map.resources :home, :only => :index
  
  map.namespace :admin do |admin|
    admin.resources :home, :only => :index
  end
  
  
  map.root :controller => "home"
  
end
