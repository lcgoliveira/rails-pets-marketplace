Rails.application.routes.draw do
  get 'pets/index'
  get 'pets/show'
  get 'pets/new'
  get 'pets/create'
  get 'pets/update'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :pets do
    resources :adoptions, only: [:new, :create]
  end

  resources :users, only: [:show] do
    collection do
      get :all_adoptions
    end
  end

end
