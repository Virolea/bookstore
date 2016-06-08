require "rails_helper"

feature "Loans Management" do
  scenario "Allow users to loan book to other users" do
    borrower = create(:user)
    loaner = create(:user)
    book = build(:book)
    book.user = loaner
    book.save

    sign_in(loaner)
    click_link "Loan Book"
    select borrower.username, from: "User"
    click_button "Loan book"

    expect(page).to have_content("#{book.title} loaned to #{borrower.username}")
  end

  scenario "Allow users to give back a book" do
    loaner = create(:user)
    borrower = create(:user)

    book = build(:book)
    book.user = loaner
    book.save

    loan = Loan.new
    loan.user = borrower
    loan.book = book
    loan.status = "loaned"
    loan.save

    sign_in(borrower)
    click_link "Return Book"
    expect(page).to have_content("#{loan.book.title} returned to #{loaner.username}")
  end
end
