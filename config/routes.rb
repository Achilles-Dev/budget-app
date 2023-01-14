Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    authenticated :user do
      root to: 'categories#index'
    end
    unauthenticated :user do
      root to: "home#index", as: :unauthenticated_root
    end
  end

  resources :categories, except: [:update] do
    resources :deals, except: [:update]
  end
end
