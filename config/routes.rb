Commit::Application.routes.draw do
  root :to => 'root#root'
  get 'welcome' => 'root#welcome'
  resource :session, :only => ['create', 'destroy', 'new']
  resources :users
end
