Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :deliverables, only: [:new, :create]
  end

  resources :deliverables, only: [:show, :destroy] do
    resources :drafts, only: [:new, :create]
  end
end
