Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    # root to: 'dashboards#show'
    get '/' => 'dashboards#show', as: ''
  end

  root to: 'homes#show'
  # get '/' => 'homes#show', as: ''

  resources :shouts, only: %i[create show] do
    member do
      post 'like' => 'likes#create'
      delete 'unlike' => 'likes#destroy'
    end
  end

  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, only: [:create]

  resources :users, only: %i[create show] do
    resources :followers, only: [:index]
    member do
      post 'follow' => 'followed_users#create'
      delete 'unfollow' => 'followed_users#destroy'
    end
    resource :password,
             controller: 'clearance/passwords',
             only: %i[edit update]
  end

  get '/sign_in' => 'sessions#new', as: 'sign_in'
  delete '/sign_out' => 'sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'users#new', as: 'sign_up'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
