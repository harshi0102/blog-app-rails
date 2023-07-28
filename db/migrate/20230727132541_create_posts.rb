class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
    end

    add_index :posts, :author_id
  end
end
