class PaypalPayment < Payment
  has_many :paypal_txns
  alias :txns :paypal_txns

  def capture(return_url, cancel_url)
    response = paypal_gateway.setup(
      payment_request,
      return_url,
      cancel_url,
      :pay_on_paypal => true,
      :no_shipping   => true
    )
    self.paypal_txns << init_paypal_txn
    self.save!
  rescue Paypal::Exception::APIError => e
    gateway_error(e)
  end

  def void
    self.paypal_txns.last.txn_type = PaymentTxn::TxnType::VOID
    self.save!
  end

  def credit
  end

  def reauthorize
  end

  private

  def init_paypal_txn
    PaypalTxn.new(
      :token            => response.token,
      :popup_uri        => response.popup_uri,
      :amount           => self.amount.to_f,
      :identifier       => SecureRandom.hex(8),
      :ack              => response.ack,
      :transaction_id   => response.transaction_id,
      :pending_reason   => response.pending_reason,
      :payment_status   => response.payment_status,
      :transaction_type => response.transaction_type,
      :payment_type     => response.payment_type,
      :response_params  => response,
      :txn_type         => PaymentTxn::TxnType::CAPTURE
    )
  end

  def paypal_gateway
    Paypal::Express::Request.new PAYPAL_CONFIG
  end

  def payment_request
    request_attributes = {
      :name        => self.order.event_name,
      :description => self.order.line_item_description,
      :amount      => self.amount.to_f,
      :quantity    => 1
    }
    Paypal::Payment::Request.new request_attributes
  end

  def gateway_error(e)
    text = e.response.details.collect(&:long_message).join('<br />')
    msg = "#{I18n.t('gateway_error')}: #{text}"
    logger.error(msg)
    raise PaymentError.new(msg)
  end
end