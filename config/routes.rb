Rails.application.routes.draw do

  get 'pages/home'
  root :to => 'pages#home'
  
  get 'session/new'
  resources :users, :only => [:new, :create]
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  
  get '/team' => 'team#show'
  
end
