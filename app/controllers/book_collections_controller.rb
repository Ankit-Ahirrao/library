class BookCollectionsController < ApplicationController

  def index
    @book_collections = BookCollection.all
  end

  def show_approved_books
    @book_collections = BookCollection.all
  end

  def get_status 
    @book_statues = BookCollection.includes(:users, :books).where('books.status = ?', params[:status])
  end
end
