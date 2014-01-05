class PrecentageOffCoupon < Coupon
  attr_accessible :precentage

  validates :precentage, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  def offer
    :precentage
  end

  def param_id
    :precentage_off_coupon
  end

  def offer_amount
    %{#{precentage}%}
  end
end