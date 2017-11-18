Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pins

  root "pins#index"
  get '/mypins/:id', to: 'pins#user_pin', as: 'user_pin'

end
