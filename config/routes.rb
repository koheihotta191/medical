Rails.application.routes.draw do
  devise_for :users

  resources :patients do
    resources :medical_records
    resources :nursing_records
  end

  root "patients#index"
end