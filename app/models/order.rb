class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :payments

  accepts_nested_attributes_for :user,  :allow_destroy => true
  accepts_nested_attributes_for :event, :allow_destroy => true

  before_validation :ensure_number
  before_save       :ensure_coupons

  validates_presence_of     :number
  validates_numericality_of :total

  attr_accessible :comment, :user_attributes, :user_id, :event_attributes

  include Order::States

  def to_param
    self.number
  end

  def total
    self.event.total
  end

  def user_attributes=(user_attrs)
    self.user = User.find_or_initialize_by_id(user_attrs['id'])
    self.user.attributes = user_attrs.delete(:id)
  end

  def event_attributes=(event_attrs)
    self.event = Event.find(event_attrs['id'])
    self.event.attributes = event_attrs.delete(:id)
  end

  private

  def ensure_number
    self.number ||= "C100#{RandomGenerator.generate_number(5)}"
  end

  def ensure_coupons
    self.coupons ||= []
  end
end