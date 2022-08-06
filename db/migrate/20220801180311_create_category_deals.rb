class CreateCategoryDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :category_deals do |t|
      t.integer :category_id
      t.integer :deal_id
      t.timestamps
    end
    add_index :category_deals, :category_id
    add_index :category_deals, :deal_id
    add_foreign_key :category_deals, :categories
    add_foreign_key :category_deals, :deals
  end
end
