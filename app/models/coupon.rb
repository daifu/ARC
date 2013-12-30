class Coupon < ActiveRecord::Base
  belongs_to :event

  attr_accessible :code, :description, :expired_at, :event_id
  validates_uniqueness_of :code
  validates_presence_of   :code
  validates_presence_of   :expired_at

  after_initialize :set_expired_at

  def self.subclasses
    [DollarOffCoupon, PrecentageOffCoupon]
  end

  private

  def set_expired_at
    self.expired_at = Time.zone.now
  end
end