class Address < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :address1, :address2, :city, :zipcode, :title, :degree, :organization, :country_id, :state_id, :state, :country

  has_one :event
  has_one :user
  belongs_to :country
  belongs_to :state

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :address1
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

  accepts_nested_attributes_for :country, :allow_destroy => false
  accepts_nested_attributes_for :state,   :allow_destroy => false

  def is_us?
    country.iso == 'US' if country
  end

  def self.default_address
    Address.new(firstname: 'firstname',
                lastname:  'lastname',
                address1:  'Dummy Address',
                state_name:'California',
                city:      'Los Angeles',
                country:   'U.S.',
                zipcode:   '100000')
  end

  private

    def phone_number_is_ok
      errors.add(:phone, 'is too short, please include area code') if self.phone && sanitize_number(self.phone).length < 10
    end

    def ensure_state_name_is_prescence_for_us
      # ensure state name is here for us
      self.state_name = self.state.name if is_us? && self.state_name.nil? && state
    end

end