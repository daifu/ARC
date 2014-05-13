class PrecentageOffCoupon < Coupon

  validates :precentage,
            :numericality => {
              :greater_than => 0,
              :less_than_or_equal_to => 100
            }

  def offer
    :precentage
  end

  def param_id
    :precentage_off_coupon
  end

  def offer_amount
    %{#{precentage}%}
  end

  def apply_discount(amt)
    if amt >= minimum_amount
      amt * (1-precentage/100)
    else
      amt
    end
  end

end