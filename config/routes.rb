Rails.application.routes.draw do
  devise_for :users, 
    controllers: { registrations: "registrations" }, 
    skip: [:sessions, :password],
    defaults: { format: :json }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
