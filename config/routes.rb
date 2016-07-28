Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  
  # authenticated :user do
  #   resources :posts
  # end
  resources :posts

  unauthenticated :user do
       resources :posts, only: [:show, :index]
  end


  root 'posts#index' 
end
