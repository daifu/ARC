class AddMinimumColumnToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :minimum_amount, :decimal, :precision => 8, :scale => 2
  end

  def down
    remove_column :coupons, :minimum_amount
  end
end
