class BookCollectionsController < ApplicationController

  def index
    @book_collections = BookCollection.all
  end

  def get_status 
    @book_statues = BookCollection.includes(:user, :book).where("books.status = ?", params[:status]).references(:books) 
  end
end
