class Book < ActiveRecord::Base
  belongs_to :user
  has_many :loans

  validates :title, :author, presence: true
end
