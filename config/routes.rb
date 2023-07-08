Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles
  root 'articles#home'
  post 'articles' => 'articles#create'
  get 'articles/new' => 'articles#new'
  get 'articles/edit' => 'articles#edit'
  get 'article' => 'articles#show'
  put 'articles/:id' => 'articles#update'
  delete 'articles/:id' => 'articles#destroy'
end
