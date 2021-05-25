Rails.application.routes.draw do
  root 'pages#home'
  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new', as: 'new_article'
  get '/articles/:id', to: 'articles#show', as: 'show_article'
  post '/articles', to: 'articles#create', as: 'create_article' 
  get '/articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  patch '/articles/:id', to: 'articles#update', as: 'update_article'
  delete '/articles/:id', to: 'articles#destroy', as: 'delete_article'
  get '/about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

end
