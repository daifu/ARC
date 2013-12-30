class LineItem < ActiveRecord::Base
  belongs_to :event

  validates_presence_of :quantity
end