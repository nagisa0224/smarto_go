class CreateToGos < ActiveRecord::Migration[6.1]
  def change
    create_table :to_gos do |t|
      t.integer :shop_id, null: false
      t.string :customer_name, null: false
      t.date :date, null: false
      t.string :time
      t.string :address
      t.text :body
      t.timestamps
    end
  end
end
