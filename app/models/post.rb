class Post < ApplicationRecord
  belongs_to :user
  belongs_to :original_post, class_name: 'Post', optional: :true
  has_many :reposts, class_name: 'Post', foreign_key: 'original_post_id'

  validates :content, length: { minimum: 2, maximum: 99 }

  after_create :update_reposts_count

  def update_reposts_count
    original_post&.update(reposts_count: original_post.reposts.count)
  end
end
