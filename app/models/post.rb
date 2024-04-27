class Post < ApplicationRecord
  belongs_to :user

  validates :content, length: { minimum: 2, maximum: 99 }
end
