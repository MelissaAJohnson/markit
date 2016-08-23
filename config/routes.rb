Rails.application.routes.draw do

  get 'users/show'

  devise_for :users

  get 'bookmarks/show'

  resources :topics do
    resources :bookmarks, except: :index
  end

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:index, :create, :destroy]
  end
  
  resources :users, only: [:show]

  root 'home#index'

  post :incoming, to: 'incoming#create'

end
