class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :check_admin, only: [:new, :edit, :destory]


  def index 
    @books = Book.all 
  end

  def show 
  end

  def new
    @book = current_user.books.build
  end

  def edit 
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save 
      redirect_to books_url
    else
      render 'new'
    end
  end

  def update 
  end

  def destory
    @book.destory
    redirect_to books_url
  end

  def check_admin 
    current_user.is_admin
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description)
    end
end
