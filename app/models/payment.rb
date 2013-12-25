class Payment
  belongs_to :order

  validates_presence_of :amount
end