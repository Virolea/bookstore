class Book < ActiveRecord::Base
  belongs_to :user
  has_many :loans

  validates :title, :author, presence: true

  def loaned?
    self.loans.where(status: "loaned").count > 0
  end
end
