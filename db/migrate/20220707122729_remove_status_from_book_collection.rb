# frozen_string_literal: true

class RemoveStatusFromBookCollection < ActiveRecord::Migration[6.1]
  def change
    remove_column :book_collections, :status, :string
  end
end
