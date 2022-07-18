# frozen_string_literal: true

class BookCollectionsController < ApplicationController
  load_and_authorize_resource
  def index
    @search = RequestSearch.new(params[:search])
    @book_collections = @search.get_request
  end

  def get_status
    @book_statues = BookCollection.includes(:user, :book).where('books.status = ?', params[:status]).references(:books)
  end
end
