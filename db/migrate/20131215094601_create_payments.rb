class CreatePayments < ActiveRecord::Migration
  def up
    create_table :payments do |t|
      t.integer :order_id
      t.decimal :amount, :scale => 2, :precision => 8, :default => 0.0, :null => false
      t.string  :type
      t.boolean :has_errors

      t.timestamps
    end
  end

  def down
    drop_table :payments
  end
end
