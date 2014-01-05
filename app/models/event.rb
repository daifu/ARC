class Event < ActiveRecord::Base
  attr_accessible :name, :description, :start_at, :stop_at, :eid
  has_and_belongs_to_many :users
                    # delete the order while the event is deleted
                    # make sure order.event and event.orders.first.event has the same reference
                    # when event.save will trigger order.save
  has_many :orders
  has_many :line_items, :extend => TotalSum
  has_many :coupons,    :extend => TotalSum
  belongs_to :address

  validates_presence_of   :name
  validates_presence_of   :eid
  validates_uniqueness_of :eid

  def total
    self.line_items.total - self.coupons.total
  end

end