class BookBank < ApplicationRecord
  belongs_to :user
  belongs_to :book

  VALID_STATUSES = ['pending', 'approved', 'rejected']

  #validates :status, inclusion: { in: VALID_STATUSES }

  def pending?
    status == 'pending'
  end

  def approved?
    status == 'approved'
  end

  def rejected?
    status == 'rejected'
  end

end
