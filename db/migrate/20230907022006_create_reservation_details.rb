class CreateReservationDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_details do |t|
      t.integer :to_go_id, null: false
      t.integer :item_id, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
