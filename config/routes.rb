Rails.application.routes.draw do
  root "owners#index"

  resources :owners
  resources :pets
  resources :vets

  resources :appointments do
    collection do
      get :past
    end
  end
end