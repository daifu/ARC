class CreateLineItems < ActiveRecord::Migration
  def up
    create_table :line_items do |t|
      t.integer :event_id
      t.decimal :amount, :scale => 2, :precision => 8, :default => 0.0, :null => false
      t.decimal :cost,   :scale => 2, :precision => 8, :default => 0.0, :null => false
      t.integer :quantity
      t.string  :description
      t.timestamps
    end
    add_index :line_items, :event_id
  end

  def down
    drop_table :line_items
  end
end
