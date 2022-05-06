Rails.application.routes.draw do

  # top-page
  root 'static_pages#top'

  # login/logout
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Messaging-API
  post '/callback', to: 'webhooks#callback'
end
