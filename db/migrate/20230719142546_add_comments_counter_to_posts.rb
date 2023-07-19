class AddCommentsCounterToPosts < ActiveRecord::Migration[7.0] # Replace 6.1 with your Rails version
  def change
    add_column :posts, :comments_counter, :integer, default: 0
  end
end
