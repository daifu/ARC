class ChangeLocationToLocationIdOnEvents < ActiveRecord::Migration
  def change
    remove_column(:events, :location)
    add_column(:events, :address_id, :integer)
  end
end
