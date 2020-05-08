Rails.application.routes.draw do
  
  root 'static#home'

  resources :ipas do 
    resources :reviews, except: :index
  end

  resources :users, except: :index 
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#facebook'
  
  get '/:anything', to: "static#home"
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
