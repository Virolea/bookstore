class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, :status, presence: true
end
