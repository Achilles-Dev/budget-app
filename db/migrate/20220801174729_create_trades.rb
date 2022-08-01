class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.integer :author_id
      t.string :name
      t.decimal :amount, precision: 12, scale: 2
      t.timestamps
    end
  end
end
