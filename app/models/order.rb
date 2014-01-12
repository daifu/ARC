class Order < ActiveRecord::Base
  attr_accessible :comment, :user_attributes, :user_id, :event_id, :coupon_id, :line_item_id, :referral_url, :user_agent

  belongs_to :user
  belongs_to :event
  belongs_to :coupon
  belongs_to :line_item

  has_many   :payments
  has_one    :address, :through => :user

  accepts_nested_attributes_for :user,  :allow_destroy => true

  before_validation         :ensure_number
  validates_presence_of     :number
  validates_numericality_of :total

  before_validation :cache_total

  include Order::States

  def to_param
    self.number
  end

  private

  def cache_total
    self.total = self.coupon.apply_discount(self.line_item.amount.to_f)
  end

  def ensure_number
    self.number = "C100#{RandomGenerator.generate_number(5)}" if self.number == "C10000000"
  end

end