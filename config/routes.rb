Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'sessions/new', to: 'sessions#new'

  # Here I use a second way to define the routes for validate using the ressource "sessions", but
  # I could use it equals
  resource :sessions, only: [] do
    post :validate
  end
end
