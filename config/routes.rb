Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'authentications#new'
  get '/auth', to: 'authentications#create'
end
