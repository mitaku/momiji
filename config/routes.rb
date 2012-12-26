RsetMcm::Engine.routes.draw do
  root :to => "home#index"

  resources :contents, :only => [:show, :edit, :update, :destroy] do
    resources :handouts, :only => [:show, :edit, :update, :create, :destroy]
  end
end
