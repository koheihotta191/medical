Rails.application.routes.draw do
  devise_for :users
  

  resources :patients do
    resources :medical_records
    resources :nursing_records
    resources :care_records
    resources :users, only: [:new, :create]
  end

  root "patients#index"
end