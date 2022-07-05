class BookCollectionsController < ApplicationController
  
  def index
    @book_collections = BookCollection.all
  end

  def get_status 
    @book_statues = Book.includes(:user).where(params[:status])
  end

  def approve_request
    BookCollection.approved!
    redirect_to book_collections_path, notice: "Book request is approved"
  end


end
