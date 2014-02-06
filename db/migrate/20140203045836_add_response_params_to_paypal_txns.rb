class AddResponseParamsToPaypalTxns < ActiveRecord::Migration
  def change
    add_column(:paypal_txns, :response_params, :text)
  end

  def down
    remove_column(:paypal_txns, :response_params)
  end
end
