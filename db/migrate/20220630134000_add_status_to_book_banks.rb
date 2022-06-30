class AddStatusToBookBanks < ActiveRecord::Migration[6.1]
  def change
    add_column :book_banks, :status, :string
  end
end
