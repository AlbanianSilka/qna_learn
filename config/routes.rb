Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  root "posts#index"
  # root to: "home#index"
end
