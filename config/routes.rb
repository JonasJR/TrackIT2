Rails.application.routes.draw do
  get 'teachers/index'

  get 'teachers/show'

  get 'teachers/approve'

  get 'admins/index'

  get 'admins/edit'

  devise_for :users
  resources :proposals
  resources :admins

  root 'pages#start'
end
