class CreateUsers < ActiveRecord::Migration[version_number]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :post_counter, default: 0

      t.timestamps
    end
  end
end
