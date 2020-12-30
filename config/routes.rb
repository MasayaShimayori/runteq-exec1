Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  resources :boards do
    get :bookmarks, on: :collection
    resources :bookmarks, only: %i[create destroy]
    resources :comments, shallow: true
  end
end
