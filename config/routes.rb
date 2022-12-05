Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#top'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/note/hashtag/:name' => 'notes#hashtag'
  get '/note/hashtag' => 'notes#hashtag'

  resources :users
  resources :brief_notes
  
  resources :notes do
    collection do
      get 'search'
    end
  end
  
end