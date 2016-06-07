class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy
  has_many :loans, through: :books
  has_many :borrowings, class_name: "Loan", dependent: :destroy

  validates :username, uniqueness: true
  validates :username, presence: true
end
