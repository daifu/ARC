class LineItem < ActiveRecord::Base
  attr_accessible :event_id, :description, :amount, :cost, :quantity

  belongs_to :event

  validates_presence_of :quantity

  def quantity_left
    self.quantity - self.quantity_used
  end

  def early_bird_amount
    early_bird_coupon = self.event.coupons.where("code='EARLYBIRD'").first
    early_bird_coupon.apply_discount(self.amount)
  end

  def early_bird_coupon_id
    self.event.coupons.where("code='EARLYBIRD'").pluck(:id).first
  end
end