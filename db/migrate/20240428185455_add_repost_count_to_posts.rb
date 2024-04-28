class AddRepostCountToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :reposts_count, :integer, null: false, default: 0
  end
end
