# frozen_string_literal: true

class BookCollection < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
