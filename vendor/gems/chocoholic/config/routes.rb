Chocoholic::Engine.routes.draw do

  resources :contents, :only => [:show] do
    collection do
      get "root"
    end
    member do
      post "mkdir"
      post "upload"

    end
    resources :handouts, :only => [:show, :edit, :update, :create]
  end

end
