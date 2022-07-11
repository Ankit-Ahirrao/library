class CreateRequestSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :request_searches do |t|

      t.timestamps
    end
  end
end
