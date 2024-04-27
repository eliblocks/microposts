require "rails_helper"

describe "Signup", type: :feature do
  it "creates a user" do
    visit new_user_registration_path

    fill_in "Email", with: "user@example.com"
    fill_in "Username", with: "eli"
    fill_in "Password", with: "microposts"
    click_button "Sign up"

    expect(page).to have_content("Welcome!")
    expect(page).to have_content("Sign out")
  end
end
