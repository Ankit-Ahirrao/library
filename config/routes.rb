Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }

  root 'static_pages#home'
  resources :books do 
    member do 
      get 'issue', to: "books#issue_book_request"
      get 'cancel', to: "books#cancel_book_request"
      get 'approved', to: "books#approve_book_request"
      get 'rejected', to: "books#reject_book_request"
    end
  end
  
  get 'book_collections', to: "book_collections#index"
  post 'book_collections/status', to: "book_collections#get_status"

end
