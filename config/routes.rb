Rails.application.routes.draw do

  get 'home/index'
  scope :api, defaults: { format: :json } do
  devise_for :users, controllers: { sessions: :sessions,passwords: :passwords },
                     path_names: { sign_in: :login }
resource :user, only: [:show, :update]

  # post
  devise_scope :user do
post 'users/verify_login', to: 'sessions#verify_login'
  end
  get 'users/list', to: 'users#index'
  get 'users/search', to: 'users#search'
# post 'password/reset', to: 'passwords#reset'
end
end
