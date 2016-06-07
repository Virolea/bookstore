module LoginMacros
  def sign_in(user)
    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  def sign_up
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "jdoe@gmail.com"
    fill_in "Username", with: "jdoe"
    fill_in "Password", with: "azertyuiop", match: :prefer_exact
    fill_in "Password confirmation", with: "azertyuiop", match: :prefer_exact
    click_button "Sign up"
  end
end
