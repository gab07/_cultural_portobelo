Rails.application.routes.draw do
  resources :categories
  # root 'books#index'

  root 'sites#index'

  
  resources :books
  resources :searches
  resources :contact_forms
  devise_for :users
  devise_scope :user do
    get "/admin", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy", as: :signout
  end

  
  get 'about'                 => 'pages#about' #creates about_path
  get '/admin/panel'          => 'sites#admin_panel'
  get '/book-index'                => 'books#index'
end
