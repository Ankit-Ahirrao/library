class Book < ApplicationRecord
  belongs_to :user
  has_many :book_banks
  has_many :added_books, through: :book_banks, source: :user
  validates :title, presence: true, length: {maximum: 50} 
  validates :author, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}



end
