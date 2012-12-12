ContentManagementFeature::Engine.routes.draw do
  resources :directories, :only => [:show, :edit, :update, :destroy] do
    member do
      post :mkdir, :to => "directories#mkdir"
    end
    resources :contents
  end
end
