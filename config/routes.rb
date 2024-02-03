Rails.application.routes.draw do
  resources :profiles
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get "up" => "rails/health#show", :as => :rails_health_check

  root "teams#index"

  get "redirect_page", to: "pages#redirect_page"

  resources :users do
    resource :profile
    collection do
      put :set_current_team
    end
  end

  resources :profiles, only: [:show]

  resources :teams do
    member do
      post :update_current_team
    end
  end
end
