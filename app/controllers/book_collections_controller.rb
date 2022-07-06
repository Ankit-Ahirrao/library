class BookCollectionsController < ApplicationController

  def index
    @book_collections = BookCollection.all
  end

  def show
    @book_collections = BookCollection.all
  end

  def get_status 
    @book_statues = Book.includes(:user).where(params[:status])
  end

end
