class AddPopupUriToPaypalTxns < ActiveRecord::Migration
  def change
    add_column(:paypal_txns, :popup_uri, :string)
  end

  def down
    remove_column(:paypal_txns, :popup_uri)
  end
end
