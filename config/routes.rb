Rails.application.routes.draw do
  root 'applicants#new'
  resources :applicants, only: [:show, :destroy] do
    collection do
      get :confirm, to: 'applicants#showConfirm'
      post :confirm
      get :complete
      post :create
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
