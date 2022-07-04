class BookCollectionsController < ApplicationController
  def index
    @book_collections = BookCollection.all
  end

  def get_status
    
  end

end
