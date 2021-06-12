Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth'}

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

  namespace :api do
    namespace :v1 do
      resource :profiles do
        get :me, :on => :collection
        get :all, :on => :collection
      end
      resources :posts do
        resources :posts, only: %i[index create]
      end
      resources :posts, only: :show
    end
  end

  root "posts#index"
  mount ActionCable.server => '/cable'
end
