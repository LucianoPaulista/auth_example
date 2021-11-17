Rails.application.routes.draw do
  resources :products
  resources :companies
  devise_for :users,
             defaults: {format: :json},
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  get '/companies', to: 'companies#show'
end
