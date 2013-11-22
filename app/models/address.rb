class Address < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :address1, :address2, :city, :zipcode

  belongs_to :event
  belongs_to :user
  belongs_to :country
  belongs_to :state

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :state, if: :is_us?
  validates_presence_of :state_name
  validates_presence_of :city,  if: :is_us?
  validates_presence_of :country
  validates_presence_of :zipcode, if: :is_us?
  validates_format_of   :zipcode,
                        :allow_blank => true,
                        with: %r{\d{5}(-\d{4})?},
                        message: "should be 12345 or 12345-1234", if: :is_us?
  validate :phone_number_is_ok

  before_validation :ensure_state_name_is_prescence_for_us

  def is_us?
    country.iso == 'US' if country
  end

  private

    def phone_number_is_ok
      errors.add(:phone, 'is too short, please include area code') if self.phone && sanitize_number(self.phone).length < 10
    end

    def ensure_state_name_is_prescence_for_us
      # ensure state name is here for us
      self.state_name = state.name if is_us? && self.state_name.nil?
    end

end