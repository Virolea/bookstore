require "rails_helper"

describe Book do
  it "has a valid Factory" do
    expect(build(:book)).to be_valid
  end

  it "is invalid without a title" do
    book = build(:book, title: nil)
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "is invalid without an author" do
    book = build(:book, author: nil)
    book.valid?
    expect(book.errors[:author]).to include("can't be blank")
  end

  it "returns false when the book is not loaned" do
    book = create(:book)
    expect(book.loaned?).to eq(false)
  end

  it "returns true when the book is loaned" do
    book = create(:book)
    user = create(:user)
    loan = Loan.new(status: "loaned")
    loan.book = book
    loan.user = user
    loan.save
    expect(book.loaned?).to eq(true)
  end
end
