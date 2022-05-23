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
    resources :questions
    resources :challenges
    post 'challenges/ajax_update', to: 'challenges#ajax_update'
    patch 'challenges/update_proficiency', to: 'challenges#update_proficiency'
  end

end
