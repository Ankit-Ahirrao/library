class BookMailer < ApplicationMailer

  def send_mail(user, book, subject, to_email, from_email)
    @user = user
    @book = book
    @subject = subject
    mail to: to_email, from: from_email, subject: subject
  end
  
end
