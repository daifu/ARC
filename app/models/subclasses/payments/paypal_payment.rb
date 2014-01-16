class PaypalPayment < Payment
  has_many :paypal_txn

  def capture
  end

  def void
  end

  def credit
  end

  def reauthorize
  end

  def paypal_gateway
    Paypal::Express::Request.new PAYPAL_CONFIG
  end
end