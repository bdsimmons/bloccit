Bloccit::Application.routes.draw do
  
  get "posts/index"
  devise_for :users

  resources :posts, only: [:index]
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
      resources :comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
      get '/up-vote' => 'votes#up_vote', as: :up_vote
      get '/down-vote' => 'votes#down_vote', as: :down_vote
    end
  end

  resources :users, only: [:show, :index, :update]

  get 'about' => "welcome#about"

  root to: 'welcome#index'
end
