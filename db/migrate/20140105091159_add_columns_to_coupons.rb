class AddColumnsToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :amount,    :decimal, :scale => 2, :precision => 8, :default => 0.0, :null => false
    add_column :coupons, :precentage, :integer
  end

  def down
    remove_column :coupons, :amount
    remove_column :coupons, :precentage
  end
end
