class AddQuantityUsedColumnToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quantity_used, :integer, :null => false, :default => 0
  end

  def down
    remove_column :line_items, :quantity_used
  end
end
