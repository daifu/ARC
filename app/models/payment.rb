class Payment < ActiveRecord::Base
  class PaymentError < RuntimeError; end

  belongs_to :order
  validates_presence_of :amount
  attr_accessible :amount, :type

  scope :paypal, where(:type => 'PaypalPayment')

  def md5_x(x)
    Digest::MD5.hexdigest(x.strip.downcase)
  end
end