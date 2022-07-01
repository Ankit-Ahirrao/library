class BookCollectionsController < ApplicationController
  def index
    @book_collections = BookCollection.all
  end
end
