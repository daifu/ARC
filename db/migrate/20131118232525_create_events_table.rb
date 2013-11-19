class CreateEventsTable < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :start_at
      t.datetime :stop_at

      t.timestamps
    end

    add_index(:events, :name)
    add_index(:events, :start_at)
  end

  def down
    drop_table :events
  end
end
