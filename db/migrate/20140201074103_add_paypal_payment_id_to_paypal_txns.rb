class AddPaypalPaymentIdToPaypalTxns < ActiveRecord::Migration
  def change
    add_column(:paypal_txns, :paypal_payment_id, :integer)
    add_index(:paypal_txns, :paypal_payment_id)
  end

  def down
    remove_column(:paypal_txns, :paypal_payment_id)
  end
end
