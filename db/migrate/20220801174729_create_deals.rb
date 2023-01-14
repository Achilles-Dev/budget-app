class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.integer :author_id
      t.string :name
      t.decimal :amount, precision: 12, scale: 2
      t.timestamps
    end
    add_index :deals, :author_id
    add_foreign_key :deals, :users, column: :author_id
  end
end
