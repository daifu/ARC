class AddColumnsToPaypalTxns < ActiveRecord::Migration
  def change
    add_column(:paypal_txns, :pending_reason, :string)
    add_column(:paypal_txns, :transaction_type, :string)
    add_column(:paypal_txns, :payment_type, :string)
  end

  def down
    remove_column(:paypal_txns, :pending_reason)
    remove_column(:paypal_txns, :transaction_type)
    remove_column(:paypal_txns, :payment_type)
  end
end
