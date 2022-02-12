Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get '/home', to: 'pages#home' #dasahboard page

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get "deliverables/:id/data", to: "deliverables#data", as: 'deliverables_data'
  # patch "/deliverables/:id", to: "deliverables#update" , as: 'update_deliverable'

  get '/test', to: 'pages#test'
  get '/dashboard', to: 'pages#dashboard'
  get '/projects/:id/edit', to:'pages#dashboard'
  get '/error', to: 'pages#error'

  get '/notifications', to: 'notifications#index'

  resources :notifications, only: %i[update destroy]

  resources :projects, except: [:show] do
    resources :deliverables, only: %i[new create]
    post 'project_confirmations/create'
    get 'confirm', to: 'projects#confirm'
    get 'sent', to: 'projects#sent'
  end

  get 'projects/:id(/:token)(/:role_token)', to: 'projects#show', as: 'show_project'
  get 'projects/:id/:token/:role_token/sign_up', to: 'projects#sign_up'

  resources :deliverables, only: %i[show destroy edit update index] do
    resources :drafts, only: %i[new create index]
  end

  resources :drafts, only: [:show] do
    resources :comments, only: %i[index new create]
    get 'approve', to: 'drafts#approve'
    get 'reject', to: 'drafts#reject'
  end

  resources :comments, only: [:show] do
    resources :replies, only: %i[new create]
  end

  resources :organisations

  resources :roles, only: [:update]

  namespace :api do
    namespace :v1 do
      resources :deliverables, only: [:index]
      resources :projects, only: [:index, :show] do
        get 'deliverables', to: "projects#deliverables"
      end
    end
  end
end
