Rails.application.routes.draw do
  get 'teachers/index'

  get 'teachers/show'

  get 'admins/index'

  get 'admins/show'

  devise_for :users
  resources :proposals

  root 'pages#start'
end
