Rails.application.routes.draw do

  resources :centres

  root 'centres#index'

end
