Rails.application.routes.draw do
  get 'book_banks', to: "book_banks#index"
  root 'static_pages#home'
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do 
    member do 
      get 'issue', to: "books#issue_book_request"
      get 'cancel', to: "books#cancel_book_request"
    end
  end

end
