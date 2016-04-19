Rails.application.routes.draw do
  resources :proposals

  root 'pages#start'
end
