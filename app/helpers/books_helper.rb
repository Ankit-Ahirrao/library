module BooksHelper

  def show_book_status_on_button(book)
    if !book.issue_request && book.not_issued?
      value = "Request"
      path = issue_book_path(book)
      return value, path
    elsif book.issue_request && book.pending?
      value = "Cancel"
      path = cancel_book_path(book)
      return value, path
    elsif book.issue_request && book.approved?
      value = "Approved"
      path = "#"
      return value, path
    elsif book.issue_request && book.status=="rejected"
      value = "Rejected"
      path = "#"
      return value, path
    end
  end
end
