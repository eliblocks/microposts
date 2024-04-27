require "rails_helper"

describe "Signin", type: :feature do
  let(:user) { create(:user, password: "microposts") }

  it "signs in a user" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "microposts"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Sign out")
  end
end
