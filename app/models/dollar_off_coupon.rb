class DollarOffCoupon < Coupon
  include ActionView::Helpers::NumberHelper

  validates :amount, :numericality => { :greater_than => 0 }

  def offer
    :amount
  end

  def param_id
    :dollar_off_coupon
  end

  def offer_amount
    number_to_currency(amount)
  end

  def apply_discount(amt)
    if amt >= minimum_amount
      amt - amount
    else
      amt
    end
  end

end