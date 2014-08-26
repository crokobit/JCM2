Rails.application.routes.draw do
  root 'articles#index'
  resources :articles, only: [:index]
  get '/refresh', to: "articles#refresh"
end
