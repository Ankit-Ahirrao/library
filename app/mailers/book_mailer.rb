class BookMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_mailer.issue.subject
  #
  def issue(user, book)
    @user = user
    @book = book
    mail to: "admin@gmail.com", from: @user.email, subject: "Book Issue Request" 
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_mailer.approve.subject
  #
  def approve(user, book)
    @user = user
    @book = book
    mail to: @user.email, from: "admin@gmail.com", subject: "Book Request Approved" 
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_mailer.cancel.subject
  #
  def cancel(user, book)
    @user = user
    @book = book
    mail to: @user.email, subject: "Book Request Cancelled" 
  end
end
