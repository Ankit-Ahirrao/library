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
    @book = current_user.books.find(params[:id])
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save 
      redirect_to books_url, notice: "Book is added"
    else
      render 'new'
    end
  end

  def update 
    @book = current_user.books.find(params[:id])
    if @book.update(book_params)
      redirect_to books_url, notice: "Book details are updated"
    else
      render 'edit'
    end
  end

  def destroy
    current_user.books.find(params[:id]).destroy
    redirect_to books_url, notice: "Book is destroyed"
  end

  def check_admin 
    current_user.is_admin
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description)
    end
end
