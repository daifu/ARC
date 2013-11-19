class Country < ActiveRecord::Base
  attr_accessible :name, :iso3, :iso, :iso_name, :numcode
end