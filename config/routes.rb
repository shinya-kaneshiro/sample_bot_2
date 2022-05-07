Rails.application.routes.draw do

  # top-page
  root 'static_pages#top'

  # login/logout
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Messaging-API
  post '/callback', to: 'webhooks#callback'

  resources :users do
    member do
      # 問題関連
      #get 'questions/new'
      get '/questions/top', to: 'questions#new'
      get 'questions/index'
    end
  end

end
