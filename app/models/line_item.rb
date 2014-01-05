class LineItem < ActiveRecord::Base
  attr_accessible :event_id, :description, :amount, :cost, :quantity
  
  belongs_to :event

  validates_presence_of :quantity

  def quantity_left
    self.quantity - self.quantity_used
  end

  def early_bird_amount
    early_bird_coupon = DollarOffCoupon.find 12
    earlyapply_discount.apply_discount(self.amount)
  end
end