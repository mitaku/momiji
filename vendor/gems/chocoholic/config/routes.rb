Chocoholic::Engine.routes.draw do

  resources :contents, :only => [:show, :edit, :update, :destroy] do
    collection do
      get "root"
    end

    member do
      post "mkdir"
      post "upload"
    end

    resources :handouts, :only => [:show, :edit, :update, :create, :destroy]
  end

end
