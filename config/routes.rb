Rails.application.routes.draw do
  get 'teachers/index'

  get 'teachers/show'

  get 'teachers/approve'

  get 'proposals/approve'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :proposals do
    resources :motivations do
      post :approve
    end
    get :approved
  end
  put 'proposals/:id/approved' => 'proposals#approved'

  resources :admins

  root 'pages#start'
end
