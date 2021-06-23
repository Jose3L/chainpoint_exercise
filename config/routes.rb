Rails.application.routes.draw do
  get '/submit', to: 'submit#index'
  post '/submit', to: 'submit#create'
  get '/success', to: 'success#index'
end
