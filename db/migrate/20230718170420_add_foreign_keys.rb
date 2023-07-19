class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
  end
end
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :photo, limit: 2048  # Set the limit for the photo column
      t.timestamps
    end
  end
end
class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author, foreign_key: { to_table: :users }
      t.timestamps
    end
    add_index :posts, :author_id  # Add index to the author_id column
  end
end
