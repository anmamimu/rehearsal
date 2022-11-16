Rails.application.routes.draw do

  root 'static_pages#top'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :brief_notes
  
  resources :notes do
    collection do
      get 'search'
    end
  end
  
end