class BooksController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :find_book, only: %i[show reject_book_request issue_book_request approve_book_request
    cancel_book_request]
  
  def index 
    @books = Book.paginate(page: params[:page])
  end

  def show
    if @book.issue_request && !current_user
      redirect_to books_path, notice: "This book is issued by other user, please check another books"
    end 
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
    @book.update(issue_request: true, status: "pending")
    current_user.book_requests << @book
    BookMailer.send_mail(current_user, @book, "Book Issue Request", "admin@gmail.com", current_user.email).deliver
    redirect_to book_path(@book), notice: "Book request sent to admin for approval"
  end

  def cancel_book_request
    @book.update(issue_request: false, status: "not issued")
    current_user.book_requests.delete(@book)
    BookMailer.send_mail(current_user, @book, "Book Request Cancelled", current_user.email, "noreply@example.com").deliver
    redirect_to book_path(@book), notice: "Book request cancelled"
  end

  def approve_book_request
    @book.update(status: "approved")
    BookMailer.send_mail(current_user, @book, "Book Request Approved", current_user.email, "admin@gmail.com").deliver
    redirect_to book_path(@book), notice: "Book request is approved"
  end

  def reject_book_request
    @book.update(issue_request: false, status: "not issued")
    current_user.book_requests.delete(@book)
    redirect_to book_path(@book), notice: "Book request rejected"
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :status)
    end

    def find_book
      @book = Book.find(params[:id])
    end

end
