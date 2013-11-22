class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.string :abbr
      t.integer :country_id
    end
  end

  def self.down
    drop_table(:states)
  end
end
