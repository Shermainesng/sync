Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }
  root to: 'pages#landing'
  get '/home', to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get "deliverables/:id/data", to: "deliverables#data", as: 'deliverables_data'
  # patch "/deliverables/:id", to: "deliverables#update" , as: 'update_deliverable'

  get "/test", to: "pages#test"

  get '/notifications', to: "notifications#index"

  resources :notifications, only: [:update, :destroy]

  resources :projects, except: :show do
    resources :deliverables, only: [:new, :create]
    post 'project_confirmations/create'
    get 'confirm', to: "projects#confirm"
    get 'sent', to: "projects#sent"
  end

  get "projects/:id(/:token)", to: "projects#show", as: 'show_project'
  get "projects/:id/:token/sign_up", to: "projects#sign_up"

  resources :deliverables, only: [:show, :destroy, :edit, :update, :index] do
    resources :drafts, only: [:new, :create, :index]
  end

  resources :drafts, only: [:show] do
    resources :comments, only: [:index, :new, :create]
    get 'approve', to: 'drafts#approve'
    get 'reject', to: 'drafts#reject'
  end

  resources :comments, only: [:show] do
    resources :replies, only: [:new, :create]
  end


  resources :organisations

end
