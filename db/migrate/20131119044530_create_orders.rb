class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.integer :user_id
      t.integer :number
      t.decimal :total, :precision => 8, :scale => 2
      t.string :referral_url, :limit => 2048
      t.string :user_agent, :limit => 512
      t.datetime :paid_at

      t.timestamps
    end
  end

  def down
    drop_table(:orders)
  end
end
