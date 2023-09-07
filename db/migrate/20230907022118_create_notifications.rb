class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :item_id, null: false
      t.timestamps
    end
  end
end
