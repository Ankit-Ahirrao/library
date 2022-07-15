# frozen_string_literal: true

class AddStatusToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :status, :string, default: 'not issued'
    # Ex:- :default =>''
  end
end
