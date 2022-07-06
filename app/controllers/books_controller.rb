class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :admin?, only: [:new, :edit, :destory]
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
    if @book.status == "approved"
      redirect_to book_path(@book), notice: "Already issued, please issue other books"
    elsif @book.status == "pending"
      redirect_to book_path(@book), notice: "This book is requested by other user, please issue other books"
    else
      @book.update_attribute(:issue_request, true)
      @book.update_attribute(:status, "pending")
      current_user.book_requests << @book
      BookMailer.issue(current_user, @book).deliver
      redirect_to book_path(@book), notice: "Book request sent to admin for approval"
    end
  end

  def cancel_book_request
    @book.update_attribute(:status, "not issued")
    @book.update_attribute(:issue_request, false)
    current_user.book_requests.delete(@book)
    BookMailer.cancel(current_user, @book).deliver
    redirect_to book_path(@book), notice: "Book request cancelled"
  end

  def approve_book_request
    @book.update_attribute(:status, "approved")
    BookMailer.approve(current_user, @book).deliver
    redirect_to book_path(@book), notice: "Book request is approved"
  end

  def reject_book_request
    @book.update_attribute(:status, "not issued")
    @book.update_attribute(:issue_request, false)
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
