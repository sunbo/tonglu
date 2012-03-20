ActionController::Routing::Routes.draw do |map|

  map.resources :forums do |forum|
    forum.resources :topics do |topic|
      topic.resources :posts
    end
  end

  map.resources :blogs

   map.resources :users, :member => { :enable => :put } do |users|
     users.resource :account
     users.resources :roles
     users.resources :entries do |entry|
       entry.resources :entry_comments
     end
   end

  #map.resources :accounts, :member => {:show => :get}
   #map.resources :posts, :path_prefix => ":user"
   map.resources :welcomes
   map.resource :session
   map.resource :password
   map.resources :events
   map.resources :lines, :path_prefix => ":user", :collection => {:friendlines => :get,:search => :get,:searchline => :post,
     :editcity => :post,:createmap => :post,:createnote => :post,:createarticle => :post,:createcontent => :post,
     :enable => :put,:unenable => :put}
   map.root :controller => "welcome", :action => "index"


   map.manageuser ':user/manageuser/:id', :controller => 'lines', :action => 'manageuser'
   map.invite ':user/invite/:id', :controller => 'lines', :action => 'invite'
   
   map.destroyarticle ':user/destroyarticle/:line_id/:article_id', :controller => 'lines', :action => 'destroyarticle'
   map.editarticle ':user/editarticle/:line_id/:article_id', :controller => 'lines', :action => 'editarticle'
   map.updatearticle ':user/updatearticle', :controller => 'lines', :action => 'updatearticle'
   map.addarticle ':user/addarticle/:id', :controller => 'lines', :action => 'addarticle'

   map.destroycontent ':user/destroycontent/:line_id/:content_id', :controller => 'lines', :action => 'destroycontent'
   map.editcontent ':user/editcontent/:line_id/:content_id', :controller => 'lines', :action => 'editcontent'
   map.updatecontent ':user/updatecontent', :controller => 'lines', :action => 'updatecontent'
   map.addcontent ':user/addcontent/:id', :controller => 'lines', :action => 'addcontent'

   map.destroynote ':user/destroynote/:line_id/:note_id', :controller => 'lines', :action => 'destroynote'
   map.editnote ':user/editnote/:line_id/:note_id', :controller => 'lines', :action => 'editnote'
   map.updatenote ':user/updatenote', :controller => 'lines', :action => 'updatenote'
   map.addnote ':user/addnote/:id', :controller => 'lines', :action => 'addnote'
   
   map.destroymap ':user/destroymap/:line_id/:map_id', :controller => 'lines', :action => 'destroymap'
   map.editmap ':user/editmap/:line_id/:map_id', :controller => 'lines', :action => 'editmap'
   map.updatemap ':user/updatemap', :controller => 'lines', :action => 'updatemap'
   map.addmap ':user/addmap/:id', :controller => 'lines', :action => 'addmap'

   map.changecity ':user/changecity/:id', :controller => 'lines', :action => 'changecity'
   map.activate '/activate/:id', :controller => 'accounts', :action => 'show'
   map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
   map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
   map.change_password '/change_password', :controller => 'accounts', :action => 'edit'
   map.signup '/signup', :controller => 'users', :action => 'new'
   map.all_users '/all_users', :controller => 'users', :action => 'all_users'
   map.login  '/login', :controller => 'sessions', :action => 'new'
   map.logout '/logout', :controller => 'sessions', :action => 'destroy'   
  map.reg '/reg/:id/:code', :controller => 'friends', :action => 'reg'
  map.home "/home", :controller => 'welcome', :action => 'home'
#  map.showprofile ":user/profile", :controller => 'profile', :action => 'show'
#  map.editprofile ":user/profile/edit", :controller => 'profile', :action => 'edit'

   map.connect ':controller/:action/:id'
   map.connect ':controller/:action/:id.:format'
 end