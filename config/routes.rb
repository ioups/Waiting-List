Rails.application.routes.draw do
  root to: 'pages#home'
  resources :contacts, only: [:show, :new, :create] do 
    member do
      get :confirm_email
      get :renew_email
      get :optout_email
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
