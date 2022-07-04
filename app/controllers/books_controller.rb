class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :admin?, only: [:new, :edit, :destory]
  before_action :find_book, only: %i[show reject_book_request issue_book_request approve_book_request
    cancel_book_request]
  
  def index 
    @books = Book.paginate(page: params[:page])
  end

  def show 
  end

  def new
    if admin?
      @book = current_user.books.build
    else
      redirect_to books_url, notice: "Only Admins can create book" 
    end
  end

  def edit
    unless admin?
      redirect_to book_url, notice: "Only Admins can edit book details"
    end

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
    if admin? 
      current_user.books.find(params[:id]).destroy
      redirect_to books_url, notice: "Book is destroyed"
    else
      redirect_to books_url, notice: "Only Admins can delete books"
    end
  end

  def issue_book_request
    current_user.book_requests << @book
    redirect_to book_path(@book), notice: "Book request sent to admin for approval"
  end

  def cancel_book_request
    current_user.book_requests.delete(@book)
    redirect_to book_path(@book), notice: "Book request cancelled successfully"
  end

  def approve_book_request
    @book.update_attribute(:status, "approved")
    current_user.book_approved << @book
    redirect_to book_path(@book), notice: "Book request is approved"
  end

  def reject_book_request
    @book.update_attribute(:status, "rejected")
    current_user.book_requests.delete(@book)
    redirect_to book_path(@book), notice: "Book request is rejected"
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :status)
    end

    def find_book
      @book = Book.find(params[:id])
    end
end
