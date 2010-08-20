ActionController::Routing::Routes.draw do |map|

  map.resources :galleries
  map.resources :home, :only => :index
  map.resources :contacts, :only => :index
  
  map.namespace :admin do |admin|
    admin.resources :home, :only => :index
  end
  
  map.devise_for :users
  
  map.root :controller => "home"
  
  map.with_options :controller => "admin/home", :action => "index" do |f|
    f.admin "admin"
  end
  
end
