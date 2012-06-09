Cm::Application.routes.draw do
  scope "(:locale)", :locale => /en|fr/ do
    
    devise_for :users, :controllers => {:registrations => "registrations"}
    
    namespace :admin do
      resources :tools
      resources :users
      resources :admin_registrations
      resource :stats do
        scope :module => 'stats' do
          resource :page_requests
          resource :sections
          resource :referrals
          resource :search_terms
        end
      end
    end
    resources :admin
    
    resource :ping

    resources :tools do
      get :downloadtic
      scope :module => 'tools' do
        resources :reviews do
          member do
            get :toggle_active
          end
        end
      end    
    end
    resources :phases
    resources :users
    match 'search' => 'tools#index'
    match 'people' => 'people#index'
    match 'green' => 'green#index'
    match 'grow' => 'grow#index'      
    match 'balanced' => 'balanced#index'      


    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    root :to => "welcome#index"
  end
end
