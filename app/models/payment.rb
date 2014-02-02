class Payment < ActiveRecord::Base
  belongs_to :order
  validates_presence_of :amount

  scope :paypal, where(:type => 'PaypalPayment')
end