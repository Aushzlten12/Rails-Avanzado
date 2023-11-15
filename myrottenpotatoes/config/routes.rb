Myrottenpotatoes::Application.routes.draw do
  resources :movies
  root :to => redirect('/movies')
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
end
