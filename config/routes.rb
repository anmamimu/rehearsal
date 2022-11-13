Rails.application.routes.draw do

  root 'static_pages#top'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :notes 
  resources :brief_notes
end