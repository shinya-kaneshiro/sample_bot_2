Rails.application.routes.draw do
  root 'static_pages#top'
  
  post '/callback', to: 'webhooks#callback'
end
