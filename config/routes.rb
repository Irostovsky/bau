ActionController::Routing::Routes.draw do |map|

  map.resources :kits do |kit|
    kit.resources :products, :except => [:index, :show]
  end

  map.resources :galleries do |gallery|
    gallery.resources :photos, :except => :index
  end
  
  map.resources :events
  
  map.resources :home, :only => :index
  map.resources :start, :only => :index
  map.resources :contacts, :only => :index
  map.resources :description, :only => :index
  map.resources :education, :only => :index
  map.resources :service, :only => :index
  
  map.namespace :admin do |admin|
    admin.resources :home, :only => :index
  end
  
  map.devise_for :users
  
  map.root :controller => "start"
  
  map.with_options :controller => "admin/home", :action => "index" do |f|
    f.admin "admin"
  end
  
end
