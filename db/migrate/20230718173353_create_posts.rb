class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.integer :comments_counter, default: 0, null: false
      t.timestamps
    end
    add_index :posts, :author_id
  end
end
