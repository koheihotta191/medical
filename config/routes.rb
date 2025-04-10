Rails.application.routes.draw do
  get 'medical_records/index'
  get 'medical_records/new'
  get 'medical_records/create'
  get 'medical_records/show'
  get 'medical_records/edit'
  get 'medical_records/update'
  get 'medical_records/destroy'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root "patients#index"
  resources :users, only: [:new, :create]
  resources :patients do
    resources :medical_records, only: [:new, :create, :index, :show, :edit, :update]
  end
end