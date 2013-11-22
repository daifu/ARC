class AddColumnsToAddresses < ActiveRecord::Migration
  def self.up
    add_column(:addresses, :organization, :string)
    add_column(:addresses, :state_name, :string)
    add_column(:addresses, :title, :string)
    add_column(:addresses, :degree, :string)
    add_column(:addresses, :badge_first_name, :string)
    add_column(:addresses, :alternative_contact_name, :string)
    add_column(:addresses, :alternative_contact_phone_or_email, :string)
  end

  def self.down
    remove_column(:addresses, :organization)
    remove_column(:addresses, :state_name)
    remove_column(:addresses, :title)
    remove_column(:addresses, :degree)
    remove_column(:addresses, :badge_first_name)
    remove_column(:addresses, :alternative_contact_name)
    remove_column(:addresses, :alternative_contact_phone_or_email)
  end
end
