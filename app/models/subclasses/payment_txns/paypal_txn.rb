class PaypalTxn < PaymentTxn
  self.table_name = "paypal_txns"
  
  belongs_to :paypal_payment

  validates_numericality_of :amount
  validates_uniqueness_of   :token
  validates_uniqueness_of   :identifier
end