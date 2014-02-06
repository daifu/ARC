class PaypalTxn < PaymentTxn
  self.table_name = "paypal_txns"

  belongs_to :paypal_payment

  validates_numericality_of :amount
  validates_uniqueness_of   :token
  validates_uniqueness_of   :identifier

  attr_accessible :token, :popup_uri, :amount, :identifier, :ack,
                  :transaction_id, :pending_reason, :payment_status,
                  :transaction_type, :payment_type, :txn_type,
                  :response_params
end