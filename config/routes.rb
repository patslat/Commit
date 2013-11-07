Commit::Application.routes.draw do
  resource :session, only: ['create', 'destroy']
  root :to => 'root#root'
  get 'welcome' => 'root#welcome'
  resources :users
end
