class ChangeNumberToStringOnOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :number
    add_column :orders, :number, :string, :limit => 10, :null => false, :default => 'C10000000'
    add_index :orders, :number
  end

  def down
    remove_column :orders, :number
  end
end
