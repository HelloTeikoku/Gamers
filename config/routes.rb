Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
}
  root 'homes#index'

  resources :users, only: %i[index show]
  resources :favorites, only: %i[create destroy]
end
