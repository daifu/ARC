class PaypalTxn < PaymentTxn
  self.table_name = "paypal_txns"

  belongs_to :paypal_payment

  validates_numericality_of :amount
end