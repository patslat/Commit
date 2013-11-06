Commit::Application.routes.draw do
  resource :session, only: ['create', 'destroy']
  resources :users
end
