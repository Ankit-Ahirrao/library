# frozen_string_literal: true

class AddStatusToBookCollections < ActiveRecord::Migration[6.1]
  def change
    add_column :book_collections, :status, :string, default: 'not_issued'
  end
end
