require "rails_helper"

RSpec.describe Post do
  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  describe "callbacks" do
    it "updates posts count" do
      original_post = create(:post)
      repost = build(:post, original_post:)

      expect { repost.save }.to change(original_post, :reposts_count).by(1)
    end
  end
end
