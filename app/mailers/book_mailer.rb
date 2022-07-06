class BookMailer < ApplicationMailer

  def issue(user, book)
    @user = user
    @book = book
    mail to: "admin@gmail.com", from: @user.email, subject: "Book Issue Request" 
  end

  def approve(user, book)
    @user = user
    @book = book
    mail to: @user.email, from: "admin@gmail.com", subject: "Book Request Approved" 
  end

  def cancel(user, book)
    @user = user
    @book = book
    mail to: @user.email, subject: "Book Request Cancelled" 
  end
  
end
