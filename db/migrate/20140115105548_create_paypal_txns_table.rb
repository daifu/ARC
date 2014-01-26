class CreatePaypalTxnsTable < ActiveRecord::Migration
  def up
    create_table :paypal_txns do |t|
      t.string :token, :identifier, :payer_id, :transaction_id, :payment_status
      t.integer :amount
      t.timestamps
    end
  end

  def down
    drop_table :paypal_txns
  end
end
