RsetMcm::Engine.routes.draw do
  root :to => "home#index"

  resources :contents, :only => [:show, :edit, :update, :destroy]
end
