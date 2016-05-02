Rails.application.routes.draw do
  get 'teachers/index'

  get 'teachers/show'

  get 'teachers/approve'

  devise_for :users
  resources :proposals do
    get :approved
  end
  put 'proposals/:id/approved' => 'proposals#approved'

  resources :admins

  root 'pages#start'
end
