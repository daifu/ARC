class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  accepts_nested_attributes_for :user,  :allow_destroy => true
  accepts_nested_attributes_for :event, :allow_destroy => true

end