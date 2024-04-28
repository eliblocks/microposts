require "rails_helper"

RSpec.describe "create a post", type: :feature do
  let(:user) { create(:user) }

  it "creates a post" do
    login_as(user)
    within "#main-post-form" do
      fill_in "post_content", with: "gpt-4 now significantly smarter and more pleasant to use"
      click_button "Post"
    end

    expect(page).to have_content("gpt-4")
  end
end
