class LineItem < ActiveRecord::Base
  attr_accessible :event_id, :description, :amount, :cost, :quantity
  
  belongs_to :event

  validates_presence_of :quantity

  def quantity_left
    self.quantity - self.quantity_used
  end

  def early_bird_amount
    early_bird_coupon = self.event.coupons.where("code='EARLYBIRD'")
    early_bird_coupon.apply_discount(self.amount)
  end

  def early_bird_coupon_id
    12
  end
end