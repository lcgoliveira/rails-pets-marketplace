Rails.application.routes.draw do
  devise_for :users

  resources :users do
    get '/all_adoptions', to: "profiles#all_adoptions", as: :all_adoptions
    get '/adoption_show', to: "profiles#adoption_show", as: :adoption_show
    get '/adoption_show/edit_adoption', to: "profiles#adoption_edit", as: :adoption_edit
    patch '/adoption_show/edit_adoption', to: "profiles#adoption_update", as: :adoption_update
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :pets do
    resources :adoptions, only: [:new, :create]
  end

  resource :profiles, only: [:show]

  post '/request_reply/:id', to: 'profiles#reply_request', as: :reply

end
