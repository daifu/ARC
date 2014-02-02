class AddTxnTypeToPaypalTxn < ActiveRecord::Migration
  def change
    add_column :paypal_txns, :txn_type, :integer
  end

  def down
    remove_column :paypal_txns, :txn_type
  end
end
