def login_as(user)
  visit new_user_session_path

  fill_in "Email", with: user.email
  fill_in "Password", with: "microposts"
  click_button "Log in"
end
