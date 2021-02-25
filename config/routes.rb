Rails.application.routes.draw do
  devise_for :users

  resources :users do
    get '/all_adoptions', to: "profiles#all_adoptions", as: :all_adoptions
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :pets do
    resources :adoptions, only: [:new, :create]
  end


  resource :profiles, only: [:show]

end
