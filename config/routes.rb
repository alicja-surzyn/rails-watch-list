Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :movies, only: %i[index show] do
  end
  resources :lists, only: %i[index show create new] do
    resources :bookmarks, only: %i[new create destroy]
  end
end
