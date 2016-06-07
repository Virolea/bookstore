require "rails_helper"

feature "Books Management" do
  scenario "Forbid non logged in user to add a book" do
    visit root_path
    click_link "Add a New Book"
    error_message = "You need to sign in or sign up before continuing."
    expect(page).to have_content(error_message)
  end

  scenario "Allow logged in user to add a book" do
    # Logging in user
    user = create(:user)
    sign_in(user)

    click_link "Add a New Book"
    fill_in "Title", with: "Title"
    fill_in "Author", with: "Author"
    click_button "Add Book"

    success_message = "Successfully added Title to your collection"
    expect(page).to have_content(success_message)
  end
end
