class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :address_attributes
  has_secure_password

  has_and_belongs_to_many :events
  belongs_to :address
  has_many   :orders, :inverse_of => :user

  before_save { email.downcase! }
  before_save :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, :if => :new_or_edit?
  validates :password_confirmation, presence: true,            :if => :new_or_edit?
  after_validation { self.errors.messages.delete(:password_digest) }

  accepts_nested_attributes_for :address, :allow_destroy => true

  def add_dummy_email_and_password
    return if self.id
    self.name  ||= "tmp_user_#{SecureRandom.hex(5)}"
    self.email ||= "#{SecureRandom.hex(5)}@arc4em.org"
    self.password_confirmation ||= self.password = SecureRandom.hex(5)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def new_or_edit?
      self.id.nil? || !self.password.nil?
    end
end
