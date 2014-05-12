class Payment < ActiveRecord::Base
  class PaymentError < RuntimeError; end

  belongs_to :order
  validates_presence_of :amount

  scope :paypal, where(:type => 'PaypalPayment')

  def md5_x(x)
    Digest::MD5.hexdigest(x.strip.downcase)
  end
end