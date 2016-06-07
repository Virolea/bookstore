require "rails_helper"

feature "Users accounts" do
  scenario "Creating user account" do
    visit root_path
    click_link "Login"
    click_link "Sign up"
    fill_in "Email", with: "jdoe@gmail.com"
    fill_in "Username", with: "jdoe"
    fill_in "Password", with: "azertyuiop", match: :prefer_exact
    fill_in "Password confirmation", with: "azertyuiop", match: :prefer_exact
    click_button "Sign up"

    success_message = "Welcome! You have signed up successfully."
    expect(page).to have_content(success_message)
  end

  scenario "Log user in" do
    user = create(:user)

    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    success_message = "Signed in successfully."
    expect(page).to have_content(success_message)
  end
end
