Second::Application.routes.draw do
  resources :users

  resources :posts

  root to: "main#index"

end
