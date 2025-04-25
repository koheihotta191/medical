Rails.application.routes.draw do
  get 'medical_records/index'
  get 'medical_records/new'
  get 'medical_records/create'
  get 'medical_records/show'
  get 'medical_records/edit'
  get 'medical_records/update'
  get 'medical_records/destroy'
  devise_for :users, skip: [:registrations]
  root "patients#index"

  # 管理者用の職員登録ページ（/admin/users/new などに変更）
  namespace :admin do
    resources :users, only: [:index, :new, :create]
  end
  
  resources :patients do
    resources :medical_records, only: [:new, :create, :index, :show, :edit, :update]
  end
end