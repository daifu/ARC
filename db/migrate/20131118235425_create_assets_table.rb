class CreateAssetsTable < ActiveRecord::Migration
  def up
    create_table :assets do |t|
      t.integer :viewable_id
      t.string :viewable_type
      t.string :attachment_content_type
      t.string :attachment_file_name
      t.string :attachment_file_size
      t.string :type
      t.datetime :attachment_updated_at
      t.integer :attachment_width
      t.integer :attachment_height
    end

    add_index(:assets, [:viewable_type, :viewable_id])
  end

  def down
    drop_table(:assets)
  end
end
