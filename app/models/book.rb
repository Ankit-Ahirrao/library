class Book < ApplicationRecord
  belongs_to :user
  has_many :book_collections
  has_many :book_requests, through: :book_collections, source: :user
  validates :title, presence: true, length: {maximum: 50} 
  validates :author, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}

  VALID_STATUSES = ['approved', 'rejected', 'pending']

  validates :status, inclusion: { in: VALID_STATUSES }

  def approved?
    status == 'approved'
  end

  def rejected?
    status == 'rejected'
  end

  def pending?
    status == 'pending'
  end

end
