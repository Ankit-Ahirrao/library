Rails.application.routes.draw do
  get 'book_collections', to: "book_collections#index"
  get 'book_collections/pending', to: "books_collection#get_status"
  get 'book_collections/approved', to: "books_collection#get_status"
  get 'book_collections/rejected', to: "books_collection#get_status"
  
  root 'static_pages#home'
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do 
    member do 
      get 'issue', to: "books#issue_book_request"
      get 'cancel', to: "books#cancel_book_request"
      get 'approved', to: "books#approve_book_request"
      get 'rejected', to: "books#reject_book_request"
    end
  end

end
