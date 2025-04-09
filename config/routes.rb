Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root "patients#index"
  resources :users, only: [:new, :create]
  resources :patients
  resources :patients do
    resources :medical_records, only: [:new, :create, :index, :show, :edit, :update]
  end
end
