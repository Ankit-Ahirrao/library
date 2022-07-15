# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/book_mailer
class BookMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/book_mailer/issue
  def issue
    BookMailer.issue
  end

  # Preview this email at http://localhost:3000/rails/mailers/book_mailer/approve
  def approve
    BookMailer.approve
  end

  # Preview this email at http://localhost:3000/rails/mailers/book_mailer/cancel
  def cancel
    BookMailer.cancel
  end
end
