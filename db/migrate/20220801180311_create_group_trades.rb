class CreateGroupTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :group_trades do |t|
      t.integer :group_id
      t.integer :trade_id
      t.timestamps
    end
  end
end
