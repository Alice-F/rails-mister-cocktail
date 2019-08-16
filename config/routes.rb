Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # # index
  #   get 'cocktails', to: 'cocktails#index'

  # # new / create
  #   get 'cocktails/new', to: 'cocktails#new'
  #   post 'cocktails', to: 'cocktails#create'

  # # show
  #   get 'cocktails/:id', to: 'cocktails#show'
  root "cocktails#index"
  resources :cocktails, only: [:index, :new, :create, :show] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: :destroy
end

