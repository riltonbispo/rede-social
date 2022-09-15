Rails.application.routes.draw do
  devise_for :users
  
  devise_for :admins, skip: [:registrations], controllers: {sessions: 'admins/sessions'}

  namespace :admin do
    root to: "home#index"
    resources :admins
    resources :users, only: :index
    resources :posts, only: [:index, :show]
  end

end