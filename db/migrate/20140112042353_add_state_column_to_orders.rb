class AddStateColumnToOrders < ActiveRecord::Migration
  def change
    add_column(:orders, :state, :string, :limit => 100)
  end

  def down
    remove_column(:orders, :state)
  end
end
