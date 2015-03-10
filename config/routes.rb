Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :contacts, only: [:index]
    get 'favorite_contacts', on: :member
  end
  resources :contacts, only: [:show, :create, :update, :destroy]
  resources :contact_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create]
end
