require "rails_helper"

RSpec.describe "view user posts", type: :feature do
  it "shows hashtag posts" do
    user_post = create(:post)
    other_user_post = create(:post)

    visit posts_path
    click_on user_post.user.username

    expect(page).to have_content(user_post.content)
    expect(page).not_to have_content(other_user_post.content)
  end
end
