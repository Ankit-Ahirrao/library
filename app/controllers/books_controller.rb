class BooksController < ApplicationController

  def index 
    @books = Book.all 
  end

  def new 
    @book = Book.new
  end

  def create 
    Book.find(params[:id])
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description)
    end
end
