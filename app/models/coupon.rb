class Coupon < ActiveRecord::Base
  belongs_to :event

  validates_uniqueness_of :code
  validates_presence_of   :code
  validates_presence_of   :expired_at

  after_initialize :set_expired_at

  class CouponError < StandardError; end

  def self.subclasses
    [DollarOffCoupon, PrecentageOffCoupon]
  end

  def offer
    raise CouponError, "offer is not implemented!"
  end

  def param_id
    :coupon
  end

  private

  def set_expired_at
    self.expired_at = Time.zone.now
  end
end