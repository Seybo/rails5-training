Rails.application.routes.draw do
  root to: 'pages#index'
  resources :posts, only: [:show]
end

