require "rails_helper"

RSpec.describe "search posts", type: :feature do
  it "shows post with search term" do
    create(:post, content: "Interesting post")
    create(:post, content: "boring post")

    visit posts_path
    fill_in "Search", with: "interesting"
    click_button "Search"

    expect(page).to have_content("Interesting")
    expect(page).not_to have_content("boring")
  end
end
