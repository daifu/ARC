class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :payments

  accepts_nested_attributes_for :user,  :allow_destroy => true
  accepts_nested_attributes_for :event, :allow_destroy => true

  before_validation :ensure_number

  validates_presence_of     :number
  validates_numericality_of :total

  attr_accessible :comment, :user_attributes, :user_id

  include Order::States

  def to_param
    self.number
  end

  def total
    self.event.total
  end

  private

  def ensure_number
    self.number ||= "C100#{RandomGenerator.generate_number(5)}"
  end
end