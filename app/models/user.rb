class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :book_collections
  has_many :book_requests, through: :book_collections, source: :book
  has_many :book_approved, through: :book_collections, source: :book
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true , length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
  validates :password, presence: true, length: {minimum: 6}
  
  
  
  def issued?(book)
    book_requests.include?(book)
  end
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
