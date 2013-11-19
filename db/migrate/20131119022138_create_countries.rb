class CreateCountries < ActiveRecord::Migration
  def up
    create_table :countries do |t|
      t.string :iso_name
      t.string :iso
      t.string :name
      t.string :iso3
      t.integer :numcode
    end
  end

  def down
    drop_table(:countries)
  end
end
