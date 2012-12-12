Chocoholic::Engine.routes.draw do

  resources :contents, :only => [:show] do
    collection do
      get "root"
    end
  end

end
