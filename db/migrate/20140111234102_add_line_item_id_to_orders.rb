class AddLineItemIdToOrders < ActiveRecord::Migration
  def change
    add_column(:orders, :line_item_id, :integer)
  end

  def down
    remove_column(:orders, :line_item_id)
  end
end
