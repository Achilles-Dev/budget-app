class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.integer :author_id
      t.string :name
      t.string :icon
      t.timestamps
    end
    add_index :categories, :author_id
    add_foreign_key :categories, :users, column: :author_id
  end
end
