Rails.application.routes.draw do
  devise_for :users
  resources :proposals

  root 'pages#start'
end
