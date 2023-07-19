class CreatePosts < ActiveRecord::Migration[version_number]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
      t.integer :author_id

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
