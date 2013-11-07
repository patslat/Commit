Commit::Application.routes.draw do
  root :to => 'root#root'
  get 'welcome' => 'root#welcome'
  resource :session, :only => [:create, :destroy, :new]
  resources :users

  namespace :api do
    namespace :v1 do
      resources :goals do
        resources :commits, :only => [:create, :destroy]
      end
    end
  end
end
