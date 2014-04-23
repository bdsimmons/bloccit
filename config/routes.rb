Bloccit::Application.routes.draw do
  
  devise_for :users

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments
    end
  end

  resources :users, only: [:update]

  get 'about' => "welcome#about"

  root to: 'welcome#index'
end
