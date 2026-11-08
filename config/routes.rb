
Rails.application.routes.draw do
  # BookNest homepage
  root "books#index"

  # Book catalogue and individual book pages
  resources :books, only: [:index, :show]

  # Category listing and individual category pages
  resources :categories, only: [:index, :show]

  # About page
  get "about", to: "pages#about", as: :about
end
