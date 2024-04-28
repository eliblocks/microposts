require "rails_helper"

RSpec.describe "view hashtag posts", type: :feature do
  it "shows hashtag posts" do
    create(:post, content: "uncool post with no hashtag")
    create(:post, content: "Test post with a #superdupercool hashtag")

    visit posts_path
    click_on "#superdupercool"

    expect(page).to have_content("#superdupercool")
    expect(page).not_to have_content("uncool")
  end
end
