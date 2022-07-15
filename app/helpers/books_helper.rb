# frozen_string_literal: true

module BooksHelper
  def button_status(book)
    if !book.issue_request && book.not_issued?
      value = 'Request'
      path = issue_book_path(book)
      [value, path]
    elsif book.issue_request && book.pending?
      value = 'Cancel'
      path = cancel_book_path(book)
      [value, path]
    elsif book.issue_request && book.approved?
      value = 'Approved'
      path = '#'
      [value, path]
    elsif book.issue_request && book.status == 'rejected'
      value = 'Rejected'
      path = '#'
      [value, path]
    end
  end
end
