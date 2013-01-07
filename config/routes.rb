RsetMcm::Engine.routes.draw do
  root :to => "home#index"

  resources :contents, :only => [:show, :edit, :update, :destroy, :index] do
    resources :handouts, :only => [:show, :edit, :update, :create, :destroy] do
      collection do
        get '/download/:name' => 'handouts#download', :name => /.*/, :as => :download
      end
    end
    resources :directories, :only => [:create]
  end
end
