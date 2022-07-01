class RequestsController < ApplicationController
  def index
    @all_requests = Request.all
  end

  def approve_book_request
    @book = Request.find(params[:id])
    current_user.book_requests << @book
    redirect_to book_path(@book), notice: "Book request sent to admin for approval"
  end

  def reject_book_request
    @book = Book.find(params[:id])
    current_user.requests.delete(@book)
    redirect_to book_path(@book), notice: "Book request cancelled successfully"
  end

  def pending_book_request
  end

end
