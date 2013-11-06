Commit::Application.routes.draw do
  resource :session, only: ['create', 'destroy']
  root :to => 'root#root'
  resources :users
end
