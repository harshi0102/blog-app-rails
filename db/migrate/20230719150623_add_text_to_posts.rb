class AddTextToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :text, :text
  end
end
