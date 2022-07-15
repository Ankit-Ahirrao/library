# frozen_string_literal: true

class CreateRequestSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :request_searches, &:timestamps
  end
end
