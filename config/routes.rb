Rails.application.routes.draw do
  get 'image_page/index'
  get 'image_page/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'image_page#index'
end
