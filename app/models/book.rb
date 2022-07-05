class Book < ApplicationRecord
  belongs_to :user
  has_many :book_collections
  has_many :book_requests, through: :book_collections, source: :user
  validates :title, presence: true, length: {maximum: 50} 
  validates :author, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}

  enum :status, {
    pending: 0,
    approved: 1,
    rejected: 2
  },
  default: :pending

end
