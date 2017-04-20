Rails.application.routes.draw do

  resources :bands do
    resources :albums do
      resources :tracks
    end
  end

  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]

end
