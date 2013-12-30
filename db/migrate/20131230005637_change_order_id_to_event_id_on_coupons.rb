class ChangeOrderIdToEventIdOnCoupons < ActiveRecord::Migration
  def up
    remove_column :coupons, :order_id
    add_column    :coupons, :event_id, :integer
  end

  def down
    add_column    :coupons, :order_id, integer
    remove_column :coupons, :event_id
  end
end
