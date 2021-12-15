Rails.application.routes.draw do
  post 'project_confirmations/create'
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get "deliverables/:id/data", to: "deliverables#data", as: 'deliverables_data'
  # patch "/deliverables/:id", to: "deliverables#update" , as: 'update_deliverable'

  get "/test", to: "pages#test"

  get '/notifications', to: "notifications#index"

  resources :notifications, only: [:update]

  resources :projects do
    resources :deliverables,only: [:new, :create]
    get 'confirm', to: "projects#confirm"
    get 'sent', to: "projects#sent"
  end
  post "projects/:id/", to: "projects#show"

  resources :deliverables, only: [:show, :destroy, :edit, :update, :index] do
    resources :drafts, only: [:new, :create, :index]
  end

  resources :drafts, only: [:show] do
    resources :comments, only: [:index, :new, :create]
    get 'approve', to: 'drafts#approve'
  end

  resources :comments, only: [:show] do
    resources :replies, only: [:new, :create]
  end

end
