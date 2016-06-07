require "rails_helper"

feature "Users accounts" do
  scenario "Creating user account" do
    sign_up
    success_message = "Welcome! You have signed up successfully."
    expect(page).to have_content(success_message)
  end

  scenario "Ensure username uniqueness" do
    create(:user, username: "jdoe")
    sign_up
    expect(page).to have_content("Please review the problems below:")
    expect(page).to have_content("has already been taken")
  end

  scenario "Log user in" do
    user = create(:user)
    sign_in(user)
    success_message = "Signed in successfully."
    expect(page).to have_content(success_message)
  end
end
