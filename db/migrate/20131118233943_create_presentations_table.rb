class CreatePresentationsTable < ActiveRecord::Migration
  def up
    create_table :presentations do |t|
      t.integer :facilitator_id
      t.string :name
      t.datetime :start_at
      t.datetime :stop_at
      t.string :location
      t.text :description
      t.string :slide
      t.string :type
    end
    add_index(:presentations, :facilitator_id)
    add_index(:presentations, :name)
    add_index(:presentations, :start_at)
  end

  def down
    drop_table(:presentations)
  end
end
