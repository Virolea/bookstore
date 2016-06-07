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
end
