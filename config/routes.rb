Rails.application.routes.draw do
  post '/callback', to: 'webhooks#callback'
end
