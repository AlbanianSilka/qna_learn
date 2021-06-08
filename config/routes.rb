Rails.application.routes.draw do
  # get '/posts/:id' => 'posts#show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    member do
      put :like, to:'posts#upvote'
      put :dislike, to:'posts#downvote'
    end

    resources :comments do
      resources :answers
      member do
        put :like, to:'comments#upvote'
        put :dislike, to:'comments#downvote'
      end
    end

    delete :destroy_attachment
  end

  root "posts#index"
  # root to: "home#index"
  mount ActionCable.server => '/cable'
end
