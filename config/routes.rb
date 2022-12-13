Rails.application.routes.draw do

  root 'static_pages#top'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/guest_login' => 'sessions#guest_login'
  post '/guest_login' => 'sessions#guest_login'
  delete '/logout' => 'sessions#destroy'


  get '/note/hashtag/:name' => 'notes#hashtag'
  get '/note/hashtag' => 'notes#hashtag'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :users
  resources :brief_notes
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :notes do
    collection do
      get 'search'
    end
  end
  
end