Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users

  resources :users do
    get '/all_adoptions', to: "profiles#all_adoptions", as: :all_adoptions
    get '/adoption_show', to: "profiles#adoption_show", as: :adoption_show
    # get '/adoption_show/edit_confirm_adoption', to: "profiles#confirm_adoption_edit", as: :confirm_adoption_edit
    post '/adoption_confirm/:id', to: "profiles#adoption_confirm", as: :adoption_confirm
    post '/adoption_refuse/:id', to: "profiles#adoption_refuse", as: :adoption_refuse

  end

  resources :pets do
    resources :adoptions, only: [:new, :create]
  end

  resource :profiles, only: [:show]

  post '/request_reply/:id', to: 'profiles#reply_request', as: :reply

end
