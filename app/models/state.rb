class State < ActiveRecord::Base
  attr_accessible :name, :country_id, :abbr

  has_many :addresses
end