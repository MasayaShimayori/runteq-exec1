Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  resources :boards, only: %i[new create index]
end
