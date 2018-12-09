require 'sidekiq/web'

Rails.application.routes.draw do
  resources :users, only: :create

  get "/quotes/:search_tag", to: "quotes#index"

  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
