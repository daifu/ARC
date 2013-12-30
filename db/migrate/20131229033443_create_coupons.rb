class CreateCoupons < ActiveRecord::Migration
  def up
    create_table :coupons do |t|
      t.integer :order_id
      t.string  :description
      t.string  :type
      t.string  :code
      t.integer :usage_count
      t.datetime :expired_at

      t.timestamps
    end
    add_index :coupons, :order_id
    add_index :coupons, :expired_at
  end

  def down
    drop_table :coupons
  end
end
