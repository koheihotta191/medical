Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  devise_for :users
  

  resources :patients do
    resources :medical_records
    resources :nursing_records
    resources :care_records
  end

  root "patients#index"
end