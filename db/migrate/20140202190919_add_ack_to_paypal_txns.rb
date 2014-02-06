class AddAckToPaypalTxns < ActiveRecord::Migration
  def change
    add_column(:paypal_txns, :ack, :string)
  end

  def down
    remove_column(:paypal_txns, :ack)
  end
end
