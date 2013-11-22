class AddEventNumberToEvents < ActiveRecord::Migration
  def change
    add_column(:events, :eid, :string)
    add_index(:events, :eid)
  end
end
