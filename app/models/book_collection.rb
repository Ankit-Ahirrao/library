class BookCollection < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: {
   "not issued": 0,
   "pending": 1,
   "approved": 2,
   "rejected": 3
  }

end
