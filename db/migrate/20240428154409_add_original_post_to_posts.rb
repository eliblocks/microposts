class AddOriginalPostToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :original_post, foreign_key: { to_table: :posts }
  end
end
