class BookBanksController < ApplicationController
  before_action :authenticate_user!, :admin?
  def index
   @book_issue_requests = BookBank.all
  end
end
