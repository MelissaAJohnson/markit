Rails.application.routes.draw do
  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  devise_for :users

  resources :topics do
    resources :bookmarks, except: :index
  end

  root to: 'home#index'

end
