Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
  devise_for :users, controllers: { sessions: :sessions,passwords: :passwords },
                     path_names: { sign_in: :login }
resource :user, only: [:show, :update]
# post 'password/forgot', to: 'passwords#forgot'
# post 'password/reset', to: 'passwords#reset'
end
end
