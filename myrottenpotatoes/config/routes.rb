Myrottenpotatoes::Application.routes.draw do
  resources :movies do
    resources :reviews
  end
  root :to => redirect('/movies')
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  post 'logout' => 'sessions#destroy'
end
