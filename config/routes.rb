Rails.application.routes.draw do
  devise_for :users, only: %i[users#show users#new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
